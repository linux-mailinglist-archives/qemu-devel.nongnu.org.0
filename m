Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC44E528E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:54:16 +0100 (CET)
Received: from localhost ([::1]:47444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0VD-00033L-Lx
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:54:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX0S2-0008SK-Ef
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:50:58 -0400
Received: from smtp50.i.mail.ru ([94.100.177.110]:49202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX0Rz-0002OO-LR
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=nQ1Isvb7y54+iS20MrMBM0OXRGvzGN0hP7CBemIFdSA=; 
 t=1648039855;x=1648645255; 
 b=m+TwgKh2ASb309xRQT53b+gr3dZpV4oE4wCYw6a/qfkskjLP4iJVr1tsiafHVWwRX75kqJAJIFeCMQ4Mg0cw+8dRSQyu9vdz46nEoFt9g0IqG0ZjD2lZK+NjUsXJd5ZvYntI+dyD8itGecspC83sipAw7HZ0BIK2ewtVYMmDr0Qv/dDW2NCmtzYba5xn4nT8hG4llpL2eKX4o5f7a7tTfj1oAgEK8kmMSIIl68+uGqiFfbZIPA/9uTBUmBKFayoEsGW8OW2A7U8Rjz3TGF8b3DJgcJr0nDa6ut6QLD0XydGPC6/wsw4ILUZyDdCEPC2VRR6HDZnrPtxygHJ3LNNAkg==;
Received: by smtp50.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nX0Rv-0006h5-MZ; Wed, 23 Mar 2022 15:50:52 +0300
Message-ID: <f800a580-b60f-c15c-0b63-1b07a05ebdda@mail.ru>
Date: Wed, 23 Mar 2022 15:50:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 5/8] migration: Add block part of migration stream
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-6-nikita.lapshin@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220323105400.17649-6-nikita.lapshin@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp50.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196D8CF2CFB95539D9144AAA932A5836E553182A05F538085040B0832EE7138AF9D652F2BFE827EB25DFED9C63BDB89A9A550203E3F3B5FC55B5
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78EA80DE462DCD770EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D825C1420679FC66E8C79A29D8DB8F4D0D6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE75A64D9A1E9CA65708941B15DA834481FA18204E546F3947C5FF72824B19451C6F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370D9A29B7FD16D1239FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE7C7469154C6C3EEB9D32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED6299176DF2183F8FC7C0FE20B678CB140C12CD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B619E53A8423A11E5C089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5AA89C2727CCC55860BF81EA2FCA18B710A2D69993834EEDAD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D346B71C4B0698719D73F1B8B950628BC732A19B40D5EE84AABE4319FF4F25F23CA66500A1E9BF587651D7E09C32AA3244C0E33017666EF23071092920E6CA2909C63871F383B54D9B3927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmDZXX61oXN5WQ==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15B1A6C12683436E6A0019A35166C98266E9CAF50055106640E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.110;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp50.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

23.03.2022 13:53, Nikita Lapshin wrote:
> From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
> 
> This enable and disable block in migration stream.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
> ---
>   migration/migration.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index ad789915ce..d81f3c6891 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1338,7 +1338,8 @@ static bool check_stream_parts(strList *stream_list)
>   {
>       for (; stream_list; stream_list = stream_list->next) {
>           if (!strcmp(stream_list->value, "vmstate") ||
> -            !strcmp(stream_list->value, "dirty-bitmaps")) {
> +            !strcmp(stream_list->value, "dirty-bitmaps") ||
> +            !strcmp(stream_list->value, "block")) {
>               continue;
>           }
>   
> @@ -2621,7 +2622,8 @@ bool migrate_use_block(void)
>   
>       s = migrate_get_current();
>   
> -    return s->enabled_capabilities[MIGRATION_CAPABILITY_BLOCK];
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_BLOCK] ||
> +           migrate_find_stream_content("block");
>   }
>   
>   bool migrate_use_return_path(void)


Same as for bitmaps. Yes, I now think we should restrict using new stream-content parameter together with old capabilities, and deprecated this old capabilities.

-- 
Best regards,
Vladimir

