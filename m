Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D796D4CBD64
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:13:44 +0100 (CET)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkL1-0006LA-Un
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:13:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPkET-0002mb-Nv
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:06:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPkEQ-0004ry-P3
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646309213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+kN6uDJDhtFap1iu/+zxoh9ZVc1kY/hizjCzD2voOs=;
 b=OlcrRt7hTWVYWeJl3RPSn3JoPDOczIfDN9NgBTvCOnelhZfjddx0rNIFgLnnbbM5IOXno5
 EG1NuiixIUKdq15Whopim+HjrwFb5vRZoeFFPkRk4Ql2+FXl+Kvp3xJsxFmt1B7yImXcsE
 tJpeL7ZuZ0BDHiPfScMdPsc/D+fok7k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-uwl6c8aJOS6ZkysW0JS0kw-1; Thu, 03 Mar 2022 07:06:52 -0500
X-MC-Unique: uwl6c8aJOS6ZkysW0JS0kw-1
Received: by mail-qk1-f197.google.com with SMTP id
 t10-20020a37aa0a000000b00605b9764f71so3073901qke.22
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 04:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=Q+kN6uDJDhtFap1iu/+zxoh9ZVc1kY/hizjCzD2voOs=;
 b=nsWXY7AEG+/WdSyFvI+hsrCBqrkh7wwIx7TCxSRwVCZjPmXKmgGW75GvC7hO9qZRpg
 U/Xye2uZpIONcKjf06JWM759zgMvsGEeYEnGiiYTfWiGR6l52IJNXXuTOkn53qXlguuV
 VoKauj/XnmwS/4dOvGgltBvf2VIuUgbtSSe8O4pyy7mllHi9lAsvAxKzC2e2JOquycFk
 tWahdRWHAG66qdD05jrLJVANC7X0vFETn7pkz8qnN/VilM+tr9tpFQ7tfvrfMbfle6M3
 FncgZq/zsWuYi1AW4cZOy51jSXgYjboFjm4pCH4MBfi9F8lCpGsVJxAdXGcSpq4XXXU/
 bzug==
X-Gm-Message-State: AOAM530p7vOi95RCYpgFM8rKmqRyGscO3j1I4z/pGoNsKjsmdkO+jsiR
 zNCV1AlCzd59NRj0+kD1XG0PMU/ERt3lZUvpjo4tvGfhzt8J02aY3WamIJH/gV3fgTvDp4Bq98B
 p+t3/OcbdYrZawPI=
X-Received: by 2002:a37:640b:0:b0:607:39a5:5933 with SMTP id
 y11-20020a37640b000000b0060739a55933mr17972317qkb.637.1646309212106; 
 Thu, 03 Mar 2022 04:06:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2BbgQOWxSDAEAw47uEWqWb0NRSzws0SKuVPCS96flRbrCDVoMxdsRht8m1GCLLedXl5kMAw==
X-Received: by 2002:a37:640b:0:b0:607:39a5:5933 with SMTP id
 y11-20020a37640b000000b0060739a55933mr17972308qkb.637.1646309211859; 
 Thu, 03 Mar 2022 04:06:51 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 p10-20020ae9f30a000000b00648e783ffbasm949133qkg.135.2022.03.03.04.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 04:06:50 -0800 (PST)
Message-ID: <f32ff126-bb01-b45c-771c-46bace77bf3b@redhat.com>
Date: Thu, 3 Mar 2022 13:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v7 00/31] block layer: split block APIs in global state
 and I/O
To: Kevin Wolf <kwolf@redhat.com>
References: <20220211145153.2861415-1-eesposit@redhat.com>
 <Yh5E6odY1pUw2LVf@redhat.com>
In-Reply-To: <Yh5E6odY1pUw2LVf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for the script!

> 
> Error: bdrv_get_full_backing_filename() is IO_CODE(), but calls GLOBAL_STATE_CODE() code
>        bdrv_get_full_backing_filename() -> bdrv_make_absolute_filename() -> bdrv_dirname() -> GLOBAL_STATE_CODE()

So this was something you caught in the first pass of reviews, and you said
"Why isn't this grouped as global state? (Or possibly I/O since it only
reads bs.)"

I will change bdrv_get_full_backing_filename to GS.

> 
> Error: blk_error_action() is IO_CODE(), but calls GLOBAL_STATE_CODE() code
>        blk_error_action() -> send_qmp_error_event() -> blk_iostatus_is_enabled() -> GLOBAL_STATE_CODE()

I see that blk_error_action is IO:
blk_aio_ioctl(s->qdev.conf.blk, SG_IO, io_header, scsi_block_sgio_complete, req); -> csi_block_sgio_complete -> scsi_handle_rw_error ->  blk_error_action
so let's move blk_iostatus_is_enabled to IO_CODE too, together with blk_iostatus_set_err
 
> 
> Error: bdrv_drained_end_no_poll() is IO_CODE(), but calls GLOBAL_STATE_CODE() code
>        bdrv_drained_end_no_poll() -> bdrv_do_drained_end() -> bdrv_do_drained_end() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()
> 

False positive, as it will be called in a bh in the main loop.


> Error: nbd_co_do_establish_connection() is IO_CODE(), but calls GLOBAL_STATE_CODE() code
>        nbd_co_do_establish_connection() -> nbd_handle_updated_info() -> bdrv_apply_auto_read_only() -> GLOBAL_STATE_CODE()

bdrv_apply_auto_read_only is used in many .bdrv_open callbacks, while nbd_co_do_establish_connection is IO_CODE because it is used by .bdrv_co_block_status and similar callbacks that are classified as I/O. 
Still, we can change bdrv_apply_auto_read_only in IO_CODE, and let it still be used from GLOBAL_STATE_CODE.
This implies changing also bdrv_can_set_read_only (callee in bdrv_apply_auto_read_only) in IO_CODE

> 
> Error: bdrv_drained_end_no_poll() is IO_CODE(), but calls IO_OR_GS_CODE() code
>        bdrv_drained_end_no_poll() -> bdrv_do_drained_end() -> bdrv_do_drained_end() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin_quiesce() -> IO_OR_GS_CODE()


False positive

> 
> Error: blk_drain() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
>        blk_drain() -> bdrv_ref() -> GLOBAL_STATE_CODE()

Here setting bdrv_ref as IO_OR_GS_CODE would work, as GLOBAL_STATE is still allowed call it.
Same applies for bdrv_unref, but we need to change in IO_OR_GS_CODE the following GLOBAL_STATE:
bdrv_close
bdrv_delete
bdrv_op_blocker_is_empty
bdrv_drain_all_end_quiesce

> 
> Error: bdrv_drained_begin() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
>        bdrv_drained_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

False positive
> 
> Error: bdrv_subtree_drained_begin() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
>        bdrv_subtree_drained_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()

False positive
> 
> Error: bdrv_drained_end() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
>        bdrv_drained_end() -> bdrv_do_drained_end() -> bdrv_do_drained_end() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()
> 

False positive
> Error: bdrv_subtree_drained_end() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
>        bdrv_subtree_drained_end() -> bdrv_do_drained_end() -> bdrv_do_drained_end() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()
> 

False positive
> Error: bdrv_apply_subtree_drain() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
>        bdrv_apply_subtree_drain() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()
> 

False positive

> Error: bdrv_unapply_subtree_drain() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
>        bdrv_unapply_subtree_drain() -> bdrv_do_drained_end() -> bdrv_do_drained_end() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()
> 

False positive

> Error: bdrv_co_drain() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
>        bdrv_co_drain() -> bdrv_drained_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()
> 

False positive

> Error: bdrv_drain() is IO_OR_GS_CODE(), but calls GLOBAL_STATE_CODE() code
>        bdrv_drain() -> bdrv_drained_begin() -> bdrv_do_drained_begin() -> bdrv_do_drained_begin() -> bdrv_co_yield_to_drain() -> bdrv_co_drain_bh_cb() -> bdrv_drain_all_begin() -> GLOBAL_STATE_CODE()
>

False positive

 
> Do you want to address some of these cases before we merge the series? I
> expect that usually we just miscategorised the caller, so the assertion
> wouldn't actually fail at runtime, but I haven't checked in detail yet.

I re-run the script and there are no more errors (except false positives).
Will send v8.

Emanuele


