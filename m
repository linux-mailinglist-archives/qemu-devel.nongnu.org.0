Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8918C2B2C5B
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 10:09:39 +0100 (CET)
Received: from localhost ([::1]:48998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdrYw-0006LD-0L
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 04:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kdrYC-0005p7-Hm; Sat, 14 Nov 2020 04:08:52 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kdrY9-0002ga-48; Sat, 14 Nov 2020 04:08:52 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CY8dJ66h0zXjDf;
 Sat, 14 Nov 2020 17:08:20 +0800 (CST)
Received: from DGGEMM511-MBS.china.huawei.com ([169.254.2.226]) by
 DGGEMM406-HUB.china.huawei.com ([10.3.20.214]) with mapi id 14.03.0487.000;
 Sat, 14 Nov 2020 17:08:20 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "Chenzhendong (alex)" <alex.chen@huawei.com>, "armbru@redhat.com"
 <armbru@redhat.com>
Subject: RE: [PATCH v2] json: Fix a memleak in parse_pair()
Thread-Topic: [PATCH v2] json: Fix a memleak in parse_pair()
Thread-Index: AQHWuc6dubUcIdi9WUWy+GWR1yWEeanHVdNA
Date: Sat, 14 Nov 2020 09:08:20 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BA6762C@dggemm511-mbs.china.huawei.com>
References: <20201113145525.85151-1-alex.chen@huawei.com>
In-Reply-To: <20201113145525.85151-1-alex.chen@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga01-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 04:08:31
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Chenzhendong (alex)
> Sent: Friday, November 13, 2020 10:55 PM
> To: armbru@redhat.com
> Cc: Chenzhendong (alex) <alex.chen@huawei.com>; qemu-devel@nongnu.org;
> qemu-trivial@nongnu.org; Zhanghailiang <zhang.zhanghailiang@huawei.com>;
> Chenqun (kuhn) <kuhn.chenqun@huawei.com>
> Subject: [PATCH v2] json: Fix a memleak in parse_pair()
>=20
> In qobject_type(), NULL is returned when the 'QObject' returned from
> parse_value() is not of QString type, and this 'QObject' memory will leak=
ed.
> So we need to first cache the 'QObject' returned from parse_value(), and =
finally
> free 'QObject' memory at the end of the function.
> Also, we add a testcast about invalid dict key.
>=20
> The memleak stack is as follows:
> Direct leak of 32 byte(s) in 1 object(s) allocated from:
>     #0 0xfffe4b3c34fb in __interceptor_malloc (/lib64/libasan.so.4+0xd34f=
b)
>     #1 0xfffe4ae48aa3 in g_malloc (/lib64/libglib-2.0.so.0+0x58aa3)
>     #2 0xaaab3557d9f7 in qnum_from_int
> /Images/source_org/qemu_master/qemu/qobject/qnum.c:25
>     #3 0xaaab35584d23 in parse_literal
> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:511
>     #4 0xaaab35584d23 in parse_value
> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:554
>     #5 0xaaab35583d77 in parse_pair
> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:270
>     #6 0xaaab355845db in parse_object
> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:327
>     #7 0xaaab355845db in parse_value
> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:546
>     #8 0xaaab35585b1b in json_parser_parse
> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:580
>     #9 0xaaab35583703 in json_message_process_token
> /Images/source_org/qemu_master/qemu/qobject/json-streamer.c:92
>     #10 0xaaab355ddccf in json_lexer_feed_char
> /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:313
>     #11 0xaaab355de0eb in json_lexer_feed
> /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:350
>     #12 0xaaab354aff67 in tcp_chr_read
> /Images/source_org/qemu_master/qemu/chardev/char-socket.c:525
>     #13 0xfffe4ae429db in g_main_context_dispatch
> (/lib64/libglib-2.0.so.0+0x529db)
>     #14 0xfffe4ae42d8f  (/lib64/libglib-2.0.so.0+0x52d8f)
>     #15 0xfffe4ae430df in g_main_loop_run (/lib64/libglib-2.0.so.0+0x530d=
f)
>     #16 0xaaab34d70bff in iothread_run
> /Images/source_org/qemu_master/qemu/iothread.c:82
>     #17 0xaaab3559d71b in qemu_thread_start
> /Images/source_org/qemu_master/qemu/util/qemu-thread-posix.c:519
>=20
> Fixes: 532fb5328473 ("qapi: Make more of qobject_to()")
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qobject/json-parser.c | 12 ++++++------
>  tests/check-qjson.c   |  9 +++++++++
>  2 files changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/qobject/json-parser.c b/qobject/json-parser.c index
> d083810d37..c0f521b56b 100644
> --- a/qobject/json-parser.c
> +++ b/qobject/json-parser.c
> @@ -257,8 +257,9 @@ static JSONToken
> *parser_context_peek_token(JSONParserContext *ctxt)
>   */
>  static int parse_pair(JSONParserContext *ctxt, QDict *dict)  {
> +    QObject *key_obj =3D NULL;
> +    QString *key;
>      QObject *value;
> -    QString *key =3D NULL;
>      JSONToken *peek, *token;
>=20
>      peek =3D parser_context_peek_token(ctxt); @@ -267,7 +268,8 @@ static
> int parse_pair(JSONParserContext *ctxt, QDict *dict)
>          goto out;
>      }
>=20
> -    key =3D qobject_to(QString, parse_value(ctxt));
> +    key_obj =3D parse_value(ctxt);
> +    key =3D qobject_to(QString, key_obj);
>      if (!key) {
>          parse_error(ctxt, peek, "key is not a string in object");
>          goto out;
> @@ -297,13 +299,11 @@ static int parse_pair(JSONParserContext *ctxt,
> QDict *dict)
>=20
>      qdict_put_obj(dict, qstring_get_str(key), value);
>=20
> -    qobject_unref(key);
> -
> +    qobject_unref(key_obj);
>      return 0;
>=20
>  out:
> -    qobject_unref(key);
> -
> +    qobject_unref(key_obj);
>      return -1;
>  }
>=20

Hi Alex,
  Perhaps it would be more appropriate to provide the testcase as a separat=
e patch which from Markus.

Thanks,
Chen Qun
> diff --git a/tests/check-qjson.c b/tests/check-qjson.c index
> 07a773e653..9a02079099 100644
> --- a/tests/check-qjson.c
> +++ b/tests/check-qjson.c
> @@ -1415,6 +1415,14 @@ static void invalid_dict_comma(void)
>      g_assert(obj =3D=3D NULL);
>  }
>=20
> +static void invalid_dict_key(void)
> +{
> +    Error *err =3D NULL;
> +    QObject *obj =3D qobject_from_json("{32:'abc'}", &err);
> +    error_free_or_abort(&err);
> +    g_assert(obj =3D=3D NULL);
> +}
> +
>  static void unterminated_literal(void)
>  {
>      Error *err =3D NULL;
> @@ -1500,6 +1508,7 @@ int main(int argc, char **argv)
>      g_test_add_func("/errors/unterminated/dict_comma",
> unterminated_dict_comma);
>      g_test_add_func("/errors/invalid_array_comma",
> invalid_array_comma);
>      g_test_add_func("/errors/invalid_dict_comma", invalid_dict_comma);
> +    g_test_add_func("/errors/invalid_dict_key", invalid_dict_key);
>      g_test_add_func("/errors/unterminated/literal", unterminated_literal=
);
>      g_test_add_func("/errors/limits/nesting", limits_nesting);
>      g_test_add_func("/errors/multiple_values", multiple_values);
> --
> 2.19.1


