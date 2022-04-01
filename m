Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF444EECBC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 14:02:18 +0200 (CEST)
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naFyr-00022e-Fe
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 08:02:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naFvw-0000HH-1E; Fri, 01 Apr 2022 07:59:16 -0400
Received: from smtp63.i.mail.ru ([217.69.128.43]:33428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naFvt-0000hS-Kz; Fri, 01 Apr 2022 07:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=CHFwl11j7QQmSkI9hfMJ5ivsprziP2uEI+7Uo+PrDCU=; 
 t=1648814353;x=1649419753; 
 b=LjBF0GZZ334dmBKNmd8GbSOt8ucmuDepukfi/bBidztzVVhE6TFkcgtGii+ouoOyB3VUpKXrDtDcI88dEG5vaKmfqe1BY390AwDrXz1PDtiRlvW220gf7WzjxEWHa32isYWxKNbkTe1ddBTNZ3ERmOJ0RHpPxF+tP6zYhMx+zYpC2WWPW9m69A1C10Y33qu+Z733foJxr/I4FEKh/R4uR1dfY7oy0m6mtNfs58kazQQejaFX5YsndyXye3YQk9HpbCfmPTmPpnq4Xj3VOIKQ5YTAN5CLLK/YSrW1aDO8BPkXPow5fIXQiSXaPZVUnIgIxCLL1+CHipOOUYXnewi/Qg==;
Received: by smtp63.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1naFvo-0006UB-3E; Fri, 01 Apr 2022 14:59:08 +0300
Message-ID: <698e50b2-026c-8781-8ee1-c31c929e1284@mail.ru>
Date: Fri, 1 Apr 2022 14:59:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/7] block/copy-before-write: refactor option parsing
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@openvz.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-2-vsementsov@openvz.org>
 <0d068a71-3af7-8873-9bc6-e8cac73b4d25@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <0d068a71-3af7-8873-9bc6-e8cac73b4d25@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp63.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD96DC212D1D15EACC4ACA8308985A3EC9B455786C35F6180B1182A05F5380850404C228DA9ACA6FE27D6E44F304DB3FC5EBE8AE7F19F6E6B10F033578F3A3E6F39BCD192064BF9FD49
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D9C4478D0B876341EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637670E1B164B70895C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BE56D9F86B4FA80CE8869142B879192F6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE759A2DA0C93DFCD719FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC55FE502D1F4F21543AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006372CCD0B7543C42194D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F72BE6798D603635257739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A564DEF88A36AAA40A50F942665A5CF9EB69490AE7271DD25AD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3455049D7B43D89D64CAF223AE6354C4E375D141D633CB50F7691457F8D1948A6B32F835FB382993F21D7E09C32AA3244C188E06A22609912CC037860A17B38ED2F522A1CF68F4BE05ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojhgUChjrcp6GkE3P4peFBMA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEE46E2CC05B6B55143E078C503CB084ACE8D00D9C08020F8CE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.43;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp63.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.04.2022 13:50, Hanna Reitz wrote:
> On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to add one more option of enum type. Let's refactor option
>> parsing so that we can simply work with BlockdevOptionsCbw object.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block/copy-before-write.c | 68 +++++++++++++++++++++++----------------
>>   1 file changed, 41 insertions(+), 27 deletions(-)
>>
>> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
>> index a8a06fdc09..394e73b094 100644
>> --- a/block/copy-before-write.c
>> +++ b/block/copy-before-write.c
>> @@ -24,6 +24,7 @@
>>    */
>>   #include "qemu/osdep.h"
>> +#include "qapi/qmp/qjson.h"
>>   #include "sysemu/block-backend.h"
>>   #include "qemu/cutils.h"
>> @@ -328,46 +329,49 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
>>       }
>>   }
>> -static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
>> -                                    Error **errp)
>> +static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
>>   {
>> -    QDict *bitmap_qdict = NULL;
>> -    BlockDirtyBitmap *bmp_param = NULL;
>> +    QDict *cbw_qdict = NULL;
>> +    BlockdevOptionsCbw *opts = NULL;
>>       Visitor *v = NULL;
>> -    bool ret = false;
>> -    *bitmap = NULL;
>> +    cbw_qdict = qdict_clone_shallow(options);
>> -    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
>> -    if (!qdict_size(bitmap_qdict)) {
>> -        ret = true;
>> -        goto out;
>> -    }
>> -
>> -    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
>> +    /*
>> +     * Delete BlockdevOptions base fields, that are not part of
>> +     * BlockdevOptionsCbw.
>> +     */
>> +    qdict_del(cbw_qdict, "driver");
>> +    qdict_del(cbw_qdict, "node-name");
>> +    qdict_del(cbw_qdict, "discard");
>> +    qdict_del(cbw_qdict, "cache");
>> +    qdict_extract_subqdict(cbw_qdict, NULL, "cache.");
>> +    qdict_del(cbw_qdict, "read-only");
>> +    qdict_del(cbw_qdict, "auto-read-only");
>> +    qdict_del(cbw_qdict, "force-share");
>> +    qdict_del(cbw_qdict, "detect-zeroes");
> 
> Works in practice now, but seems a bit fragile.  If new fields are added to the base class, this will break.  (And I don’t know whether people will think of updating this when new fields are added to the base class.)
> 
> Would there be a problem if instead we parsed the full BlockdevOptions object here, asserting that .driver is BLOCKDEV_DRIVER_COPY_BEFORE_WRITE?

Hmm. Thanks! Yes there is a problem with it,  as some options are already absorbed in bdrv_open_common(). But good news is that the only necessary absorbed option is "driver".

So, instead of asserting .driver, we temporary add "driver"="copy-before-write" into options, and then we can natively parse them as BlockdevOptions.

The following works for me (applied on the top of the series), will merge into v3:



diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 0ea5506f77..3d6c9fc055 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -375,40 +375,25 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
      }
  }
  
-static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
+static BlockdevOptions *cbw_parse_options(QDict *options, Error **errp)
  {
-    QDict *cbw_qdict = NULL;
-    BlockdevOptionsCbw *opts = NULL;
+    BlockdevOptions *opts = NULL;
      Visitor *v = NULL;
  
-    cbw_qdict = qdict_clone_shallow(options);
+    qdict_put_str(options, "driver", "copy-before-write");
  
-    /*
-     * Delete BlockdevOptions base fields, that are not part of
-     * BlockdevOptionsCbw.
-     */
-    qdict_del(cbw_qdict, "driver");
-    qdict_del(cbw_qdict, "node-name");
-    qdict_del(cbw_qdict, "discard");
-    qdict_del(cbw_qdict, "cache");
-    qdict_extract_subqdict(cbw_qdict, NULL, "cache.");
-    qdict_del(cbw_qdict, "read-only");
-    qdict_del(cbw_qdict, "auto-read-only");
-    qdict_del(cbw_qdict, "force-share");
-    qdict_del(cbw_qdict, "detect-zeroes");
-
-    v = qobject_input_visitor_new_flat_confused(cbw_qdict, errp);
+    v = qobject_input_visitor_new_flat_confused(options, errp);
      if (!v) {
          goto out;
      }
  
-    visit_type_BlockdevOptionsCbw(v, NULL, &opts, errp);
+    visit_type_BlockdevOptions(v, NULL, &opts, errp);
      if (!opts) {
          goto out;
      }
  
      /*
-     * Delete options which we are going to parse through BlockdevOptionsCbw
+     * Delete options which we are going to parse through BlockdevOptions
       * object for original options.
       */
      qdict_extract_subqdict(options, NULL, "bitmap");
@@ -417,7 +402,7 @@ static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
  
  out:
      visit_free(v);
-    qobject_unref(cbw_qdict);
+    qdict_del(options, "driver");
  
      return opts;
  }
@@ -428,12 +413,14 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
      BDRVCopyBeforeWriteState *s = bs->opaque;
      BdrvDirtyBitmap *bitmap = NULL;
      int64_t cluster_size;
-    g_autoptr(BlockdevOptionsCbw) opts = NULL;
+    g_autoptr(BlockdevOptions) full_opts = NULL;
+    BlockdevOptionsCbw *opts;
  
-    opts = cbw_parse_options(options, errp);
-    if (!opts) {
+    full_opts = cbw_parse_options(options, errp);
+    if (!full_opts) {
          return -EINVAL;
      }
+    opts = &full_opts->u.copy_before_write;
  
      bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,



-- 
Best regards,
Vladimir

