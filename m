Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5819B4E5280
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:51:08 +0100 (CET)
Received: from localhost ([::1]:40594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0SB-0006Va-DZ
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:51:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX0CC-0006LQ-RV
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:34:36 -0400
Received: from smtp56.i.mail.ru ([217.69.128.36]:48022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX0CA-0002uM-LG
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=4Gx8Vzg1fZASIq1xgjgolVDbxLDYMWAsqkOMXyXLllI=; 
 t=1648038874;x=1648644274; 
 b=0Nedi7SbdBrM0wuAPBz8DJGhHJm4HFmHfhaeVmxp2SbxWRw7GSUHu7xfPtu292+m/hn7AkIX/FI6PvbGcSF2B7K3jNY2TC/nOaf1Nym+Ti1WZyNADMlfMVC0ovjcvZfPanIUispYPjGaH31gXn4uBuIJ9PrvGzShRcO8SU5aqcah7g3lbGLATUhwObwiUaYiJib0AsQG4zM4bGhyhi4xWl4H0cSm8dI0b5PLmY266iJROUWHHkSZa7PnbVx+Xxv6N+Y3P8sSDNG4dBKI+6V7+sOo8lZgdxJRgUC3062X2SpiLCVv610t1yHHqX0rKtSieL7nP+WnOl8/7YN2mfqXiw==;
Received: by smtp56.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nX0C7-0004vO-6h; Wed, 23 Mar 2022 15:34:31 +0300
Message-ID: <0de01c69-950f-4be9-88bd-3c716738e02e@mail.ru>
Date: Wed, 23 Mar 2022 15:34:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/8] migration: should_skip() implemented
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-3-nikita.lapshin@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220323105400.17649-3-nikita.lapshin@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp56.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196D8CF2CFB95539D9144AAA932A5836E553182A05F538085040C842565E8B9BF8E3F1AF8F0DED4163CA77DFE3C0EE766301D9164159F3E87CD3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72AC9FB60380F23AEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370FDF1CE57EA9D07C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D881085AF3B4C6D9B00644ABF18FCE25626F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE73B0385442E67878B9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC29CCCB165C7854CD3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006370DB91CA68F887047D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FA999322EAAB3F9C26D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5721626D367F31E8781DD47D05BF9790D572381C05C6E11B3D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA754E2A133C74F7AB4F410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3483E1FCD56FEA62E64744F2B56CB2DCC99763B5827ABB90ABAF73DFA5962C9B81694234740E5E6A5D1D7E09C32AA3244CC9275C4D018BA81B79A27EA90512701EC86C126E7119A0FE927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmAZqlXJopVaww==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F1574ECE65A3CA73AE03D0CF0BFF9742186911FC8635B099D6EE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.36;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp56.i.mail.ru
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL=1.31,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
> For next changes it is convenient to make all decisions about
> sections skipping in one function.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
> ---
>   migration/savevm.c | 54 ++++++++++++++++++++++++----------------------
>   1 file changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 02ed94c180..c68f187ef7 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -943,6 +943,15 @@ static int vmstate_save(QEMUFile *f, SaveStateEntry *se,
>       return vmstate_save_state(f, se->vmsd, se->opaque, vmdesc);
>   }
>   
> +static bool should_skip(SaveStateEntry *se)
> +{
> +    if (se->ops && se->ops->is_active && !se->ops->is_active(se->opaque)) {
> +        return true;
> +    }
> +
> +    return false;

that may be simply

    return se->ops && se->ops->is_active && !se->ops->is_active(se->opaque);

But may be in future commits the code will be more complicated and we prepare for it now, will see.

> +}
> +
>   /*
>    * Write the header for device section (QEMU_VM_SECTION START/END/PART/FULL)
>    */

[..]

>           trace_savevm_section_start(se->idstr, se->section_id);
>   
> @@ -1417,6 +1417,9 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>               trace_savevm_section_skip(se->idstr, se->section_id);
>               continue;
>           }
> +        if (should_skip(se)) {
> +            continue;
> +        }

Except for this and ...

>   
>           trace_savevm_section_start(se->idstr, se->section_id);
>   
> @@ -1522,10 +1525,8 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
>           if (!se->ops || !se->ops->save_live_pending) {
>               continue;
>           }
> -        if (se->ops->is_active) {
> -            if (!se->ops->is_active(se->opaque)) {
> -                continue;
> -            }
> +        if (should_skip(se)) {
> +            continue;
>           }
>           se->ops->save_live_pending(f, se->opaque, threshold_size,
>                                      res_precopy_only, res_compatible,
> @@ -1635,6 +1636,9 @@ int qemu_save_device_state(QEMUFile *f)
>           if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
>               continue;
>           }
> +        if (should_skip(se)) {
> +            continue;
> +        }

this all other chunks are simple refactoring.

Let's do no-logic-change refactoring in a separate commit, and these two changes in another one, with description what and why.

>   
>           save_section_header(f, se, QEMU_VM_SECTION_FULL);
>   
> @@ -2542,10 +2546,8 @@ static int qemu_loadvm_state_setup(QEMUFile *f)
>           if (!se->ops || !se->ops->load_setup) {
>               continue;
>           }
> -        if (se->ops->is_active) {
> -            if (!se->ops->is_active(se->opaque)) {
> -                continue;
> -            }
> +        if (should_skip(se)) {
> +            continue;
>           }
>   
>           ret = se->ops->load_setup(f, se->opaque);


-- 
Best regards,
Vladimir

