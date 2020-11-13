Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DAD2B1DD3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 15:54:14 +0100 (CET)
Received: from localhost ([::1]:47840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdaSq-0007PK-KV
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 09:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kdaRH-0006mG-WB; Fri, 13 Nov 2020 09:52:37 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kdaRE-0002bU-DF; Fri, 13 Nov 2020 09:52:35 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CXhJB472Hz15VTY;
 Fri, 13 Nov 2020 22:51:54 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Fri, 13 Nov 2020 22:51:55 +0800
Message-ID: <5FAE9D8B.9090209@huawei.com>
Date: Fri, 13 Nov 2020 22:51:55 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] json: Fix a memleak in parse_pair()
References: <20201111115609.48888-1-alex.chen@huawei.com>
 <87imabkrmm.fsf@dusky.pond.sub.org>
In-Reply-To: <87imabkrmm.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 09:52:06
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/12 14:37, Markus Armbruster wrote:
> Alex Chen <alex.chen@huawei.com> writes:
> 
>> In qobject_type(), NULL is returned when the 'QObject' returned from parse_value() is not of QString type,
>> and this 'QObject' memory will leaked.
>> So we need to first check whether the 'QObject' returned from parse_value() is of QString type,
>> and if not, we free 'QObject' memory and return an error.
>>
>> The memleak stack is as follows:
>> Direct leak of 32 byte(s) in 1 object(s) allocated from:
>>     #0 0xfffe4b3c34fb in __interceptor_malloc (/lib64/libasan.so.4+0xd34fb)
>>     #1 0xfffe4ae48aa3 in g_malloc (/lib64/libglib-2.0.so.0+0x58aa3)
>>     #2 0xaaab3557d9f7 in qnum_from_int /Images/source_org/qemu_master/qemu/qobject/qnum.c:25
>>     #3 0xaaab35584d23 in parse_literal /Images/source_org/qemu_master/qemu/qobject/json-parser.c:511
>>     #4 0xaaab35584d23 in parse_value /Images/source_org/qemu_master/qemu/qobject/json-parser.c:554
>>     #5 0xaaab35583d77 in parse_pair /Images/source_org/qemu_master/qemu/qobject/json-parser.c:270
>>     #6 0xaaab355845db in parse_object /Images/source_org/qemu_master/qemu/qobject/json-parser.c:327
>>     #7 0xaaab355845db in parse_value /Images/source_org/qemu_master/qemu/qobject/json-parser.c:546
>>     #8 0xaaab35585b1b in json_parser_parse /Images/source_org/qemu_master/qemu/qobject/json-parser.c:580
>>     #9 0xaaab35583703 in json_message_process_token /Images/source_org/qemu_master/qemu/qobject/json-streamer.c:92
>>     #10 0xaaab355ddccf in json_lexer_feed_char /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:313
>>     #11 0xaaab355de0eb in json_lexer_feed /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:350
>>     #12 0xaaab354aff67 in tcp_chr_read /Images/source_org/qemu_master/qemu/chardev/char-socket.c:525
>>     #13 0xfffe4ae429db in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x529db)
>>     #14 0xfffe4ae42d8f  (/lib64/libglib-2.0.so.0+0x52d8f)
>>     #15 0xfffe4ae430df in g_main_loop_run (/lib64/libglib-2.0.so.0+0x530df)
>>     #16 0xaaab34d70bff in iothread_run /Images/source_org/qemu_master/qemu/iothread.c:82
>>     #17 0xaaab3559d71b in qemu_thread_start /Images/source_org/qemu_master/qemu/util/qemu-thread-posix.c:519
> 
> Good catch, thanks!
> 
>> Fixes: 532fb5328473 ("qapi: Make more of qobject_to()")
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>> ---
>>  qobject/json-parser.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/qobject/json-parser.c b/qobject/json-parser.c
>> index d083810d37..b37762a203 100644
>> --- a/qobject/json-parser.c
>> +++ b/qobject/json-parser.c
>> @@ -267,10 +267,13 @@ static int parse_pair(JSONParserContext *ctxt, QDict *dict)
>>          goto out;
>>      }
>>  
>> -    key = qobject_to(QString, parse_value(ctxt));
>> -    if (!key) {
>> -        parse_error(ctxt, peek, "key is not a string in object");
>> +    value = parse_value(ctxt);
>> +    if (!value || qobject_type(value) != QTYPE_QSTRING) {
> 
> The "is string" test becomes more cumbersome.  Also, we reuse @value for
> another purpose.
> 
>> +        qobject_unref(value);
>> +        parse_error(ctxt, peek, "value is not a string in object");
> 
> Changing error messages in a memory leak fix is inappropriate.
> Accident?
> 
>>          goto out;
>> +    } else {
>> +        key = qobject_to(QString, value);
>>      }
>>  
>>      token = parser_context_pop_token(ctxt);
> 
> Here's a simpler, straightforward fix, with a test case thrown in:
> 
> diff --git a/qobject/json-parser.c b/qobject/json-parser.c
> index d083810d37..c0f521b56b 100644
> --- a/qobject/json-parser.c
> +++ b/qobject/json-parser.c
> @@ -257,8 +257,9 @@ static JSONToken *parser_context_peek_token(JSONParserContext *ctxt)
>   */
>  static int parse_pair(JSONParserContext *ctxt, QDict *dict)
>  {
> +    QObject *key_obj = NULL;
> +    QString *key;
>      QObject *value;
> -    QString *key = NULL;
>      JSONToken *peek, *token;
>  
>      peek = parser_context_peek_token(ctxt);
> @@ -267,7 +268,8 @@ static int parse_pair(JSONParserContext *ctxt, QDict *dict)
>          goto out;
>      }
>  
> -    key = qobject_to(QString, parse_value(ctxt));
> +    key_obj = parse_value(ctxt);
> +    key = qobject_to(QString, key_obj);
>      if (!key) {
>          parse_error(ctxt, peek, "key is not a string in object");
>          goto out;
> @@ -297,13 +299,11 @@ static int parse_pair(JSONParserContext *ctxt, QDict *dict)
>  
>      qdict_put_obj(dict, qstring_get_str(key), value);
>  
> -    qobject_unref(key);
> -
> +    qobject_unref(key_obj);
>      return 0;
>  
>  out:
> -    qobject_unref(key);
> -
> +    qobject_unref(key_obj);
>      return -1;
>  }
>  
> diff --git a/tests/check-qjson.c b/tests/check-qjson.c
> index 07a773e653..9a02079099 100644
> --- a/tests/check-qjson.c
> +++ b/tests/check-qjson.c
> @@ -1415,6 +1415,14 @@ static void invalid_dict_comma(void)
>      g_assert(obj == NULL);
>  }
>  
> +static void invalid_dict_key(void)
> +{
> +    Error *err = NULL;
> +    QObject *obj = qobject_from_json("{32:'abc'}", &err);
> +    error_free_or_abort(&err);
> +    g_assert(obj == NULL);
> +}
> +
>  static void unterminated_literal(void)
>  {
>      Error *err = NULL;
> @@ -1500,6 +1508,7 @@ int main(int argc, char **argv)
>      g_test_add_func("/errors/unterminated/dict_comma", unterminated_dict_comma);
>      g_test_add_func("/errors/invalid_array_comma", invalid_array_comma);
>      g_test_add_func("/errors/invalid_dict_comma", invalid_dict_comma);
> +    g_test_add_func("/errors/invalid_dict_key", invalid_dict_key);
>      g_test_add_func("/errors/unterminated/literal", unterminated_literal);
>      g_test_add_func("/errors/limits/nesting", limits_nesting);
>      g_test_add_func("/errors/multiple_values", multiple_values);
> 

Thanks for your review，your patch is better than mine.
I will send the patch v2.

Thanks,
Alex



