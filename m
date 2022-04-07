Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CE64F88EB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 23:52:34 +0200 (CEST)
Received: from localhost ([::1]:52484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nca3M-0000m7-PF
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 17:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nca2V-0008PR-VA; Thu, 07 Apr 2022 17:51:39 -0400
Received: from smtp17.mail.ru ([94.100.176.154]:33542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nca2T-0007RE-Fp; Thu, 07 Apr 2022 17:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=FQtxptQM6S6HR/SseySrvW6Bjah0fPMq9Fep5IBGkoM=; 
 t=1649368297;x=1649973697; 
 b=F4jVr90MdhVSsjpaZ1INpj/bAocFHd7AEXikSjEHinCRxTO8JZOF5ChBw3inQSXtbLM2rWwnhlqaqm63Co04F4eZnVU2jb84XHsygrc3ME+C/ibEzzKTev+qLaHAqKIlifSdRDcuB7DWDrPoUK2VdSkBehkYDBv1H2iNu2P+M3VRjLDnQF7l0+3Kla7lNFU67zYC6nuy9eaTAbk0+ZRGgN30yGIEiCxtVxEE9KRfS8y9sxSr70z1B4VI6OVJ/MXEoine0HmXIButLynFb5lKeAsI8EZo8B2ILipCN9DmoLSaht4jEEYMt4d0kwv6+j05l8JiEiakQtEm8OR05rICUA==;
Received: by smtp17.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nca2P-0008Vi-Ay; Fri, 08 Apr 2022 00:51:33 +0300
Message-ID: <ff0ffd84-2333-7779-5888-c5d5a44836b0@mail.ru>
Date: Fri, 8 Apr 2022 00:51:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for 7.1 1/1] block: add 'force' parameter to
 'blockdev-change-medium' command
Content-Language: en-US
To: "Denis V. Lunev" <den@openvz.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20220407204812.691015-1-den@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220407204812.691015-1-den@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp17.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9B63E071AA8307CB866F17EBA3505241B126DD4BD1F20CBEE182A05F5380850405799C9D93BEC76B44C902B9839ED39D20A0D89FF5379C82A1E1A6D4364E7EC65
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BA0D57D3459E5640EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E8F1A1743CF948808638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D826F0CF3E8CAA1D9D6EB4E4278938BAF66F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7C88295285D2BDD949FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE652FD71AFB96DC7DCFA063A519E5965DD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE3B355ED1E20F5346ABA3038C0950A5D36B5C8C57E37DE458B0BC6067A898B09E46D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE728E0B16DA17939D7731C566533BA786AA5CC5B56E945C8DA
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5D9DE90B5A99BB61CF2542BE6CDC8D344FEFED59CF8600018D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34A503FBFE8BE8FC49DA7F0A8B7F9B3783FD739440E85B6E64778FDBCE9CB5BD41F55A99FBDFA723961D7E09C32AA3244C00B627EBF2393ABCAC72BAE6DD7D5089D08D48398F32B4A6AD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojzDs61/8Pi1Eky+P/wFnTTQ==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C39137976B6ED9DDDBC6D44CB1C4FE38F1D625B78D5B391FE76A1E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.176.154;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp17.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

07.04.2022 23:48, Denis V. Lunev wrote:
> 'blockdev-change-medium' is a convinient wrapper for the following
> sequence of commands:
>   * blockdev-open-tray
>   * blockdev-remove-medium
>   * blockdev-insert-medium
>   * blockdev-close-tray
> and should be used f.e. to change ISO image inside the CD-ROM tray.
> Though the guest could lock the tray and some linux guests like
> CentOS 8.5 actually does that. In this case the execution if this
> command results in the error like the following:
>    Device 'scsi0-0-1-0' is locked and force was not specified,
>    wait for tray to open and try again.
> 
> This situation is could be resolved 'blockdev-open-tray' by passing
> flag 'force' inside. Thus is seems reasonable to add the same
> capability for 'blockdev-change-medium' too.
> 
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> CC: Eric Blake <eblake@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> ---
>   block/qapi-sysemu.c | 3 ++-
>   monitor/hmp-cmds.c  | 4 +++-
>   qapi/block.json     | 6 ++++++
>   3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
> index 8498402ad4..5b4fb75787 100644
> --- a/block/qapi-sysemu.c
> +++ b/block/qapi-sysemu.c
> @@ -318,6 +318,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
>                                   bool has_id, const char *id,
>                                   const char *filename,
>                                   bool has_format, const char *format,
> +                                bool has_force, bool force,
>                                   bool has_read_only,
>                                   BlockdevChangeReadOnlyMode read_only,
>                                   Error **errp)
> @@ -380,7 +381,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
>   
>       rc = do_open_tray(has_device ? device : NULL,
>                         has_id ? id : NULL,
> -                      false, &err);
> +                      has_force ? force : false, &err);

It's guaranteed for force to be false when has_force is false (ans similarly for pointers), so that can be written as

   rc = do_open_tray(device, id, force, &err);

>       if (rc && rc != -ENOSYS) {
>           error_propagate(errp, err);
>           goto fail;
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 634968498b..d8b98bed6c 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1472,6 +1472,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>       const char *target = qdict_get_str(qdict, "target");
>       const char *arg = qdict_get_try_str(qdict, "arg");
>       const char *read_only = qdict_get_try_str(qdict, "read-only-mode");
> +    bool force = qdict_get_try_bool(qdict, "force", false);
>       BlockdevChangeReadOnlyMode read_only_mode = 0;
>       Error *err = NULL;
>   
> @@ -1508,7 +1509,8 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>           }
>   
>           qmp_blockdev_change_medium(true, device, false, NULL, target,
> -                                   !!arg, arg, !!read_only, read_only_mode,
> +                                   !!arg, arg, true, force,
> +                                   !!read_only, read_only_mode,
>                                      &err);
>       }
>   

Should we also update hmp-commands.hx ? Or you just can pass "false, false" if you don't really need hmp interface for new feature.

Also, I don't know what ui/cocoa.m is, but seems it has call to qmp_blockdev_change_medium(), which most probably should be updated too.

> diff --git a/qapi/block.json b/qapi/block.json
> index 82fcf2c914..3f100d4887 100644
> --- a/qapi/block.json
> +++ b/qapi/block.json
> @@ -326,6 +326,11 @@
>   # @read-only-mode: change the read-only mode of the device; defaults
>   #                  to 'retain'
>   #
> +# @force: if false (the default), an eject request through blockdev-open-tray
> +#         will be sent to the guest if it has locked the tray (and the tray
> +#         will not be opened immediately); if true, the tray will be opened
> +#         regardless of whether it is locked. (since 7.1)
> +#
>   # Features:
>   # @deprecated: Member @device is deprecated.  Use @id instead.
>   #
> @@ -367,6 +372,7 @@
>               '*id': 'str',
>               'filename': 'str',
>               '*format': 'str',
> +            '*force': 'bool',
>               '*read-only-mode': 'BlockdevChangeReadOnlyMode' } }
>   
>   


-- 
Best regards,
Vladimir

