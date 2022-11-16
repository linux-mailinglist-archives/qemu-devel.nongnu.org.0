Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F10362C4E8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 17:42:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovLSr-0005VJ-7R; Wed, 16 Nov 2022 11:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ovLSo-0005Uz-0b
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:40:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ovLSl-0000AX-JE
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668616833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=olBscTJSjrzX2aM24iLJnFn6rGVmV6jsjLtE1IEM6LQ=;
 b=PN66RHtVnxi7xaAhf5rasfFpnFjVPLLSY8UBbQ99JXF0/RexjeNeg+t6JnDniafzles41z
 8Lq0oeHabXDRObGhE4rHxUZKfgLyr1KhkoWe8c3ov1+4fEfZbQ6zWcvyNyJoiqsfxTIUcX
 Y+0p0V4I6o5BfitnU6dqqGsoafgS2zE=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-vd64JaO5OIyh5H8I2nQdgA-1; Wed, 16 Nov 2022 11:40:32 -0500
X-MC-Unique: vd64JaO5OIyh5H8I2nQdgA-1
Received: by mail-pf1-f197.google.com with SMTP id
 bq9-20020a056a000e0900b00571802a2eaaso9462811pfb.22
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 08:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=olBscTJSjrzX2aM24iLJnFn6rGVmV6jsjLtE1IEM6LQ=;
 b=3Ajxi6PKvx6fWG6gvMTBUA1P3LPaXMRAPhlFoYRxKRGyg+sHxCpGonLZ6Fa7UV9fCN
 BQ4mHWRmD+tpJ4n9Vs+zt5Y/6v3zO1h9Zn0+xDuLVDWE+6I8DWW63wlCuOPfOtHNHuAV
 JgsI6x0Ps0H8rsFcb1at36CgG09i117MvrKucX02kJYyq5hVcF49FhRXtjimNvAh8EFz
 FRXZpjY467AusWgkxMaaQlo6Lc4wL2GCbr4pfwE2thJYuNiFwS7FmEQE9XXYXNyemsrZ
 /tK1hRVfUJvJ916G9Upu3MoiW7BfvDSQyd4ubrE15s+Kwu9KU3x0Taq92iujAuNmkY7Y
 HLnw==
X-Gm-Message-State: ANoB5pkmmHgT8Qf+Onv3nGvnPvYJASPPscOgu2d2X0p/l/47IRx5hr94
 P10sqCFKYlvUnUb+G6LFamKUfh40TsSb8ClguCn1F3V2nA2CodBd4dmDtQn1ztPpZwrgdZ0qxwF
 FZaQCekryLcAjr8k=
X-Received: by 2002:a17:902:7c17:b0:186:9fc8:6688 with SMTP id
 x23-20020a1709027c1700b001869fc86688mr9651978pll.22.1668616831135; 
 Wed, 16 Nov 2022 08:40:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7xDSFJnabUHqTqiX2R8hgedhJb9LliO/uHEsuYD4fAGPQVQgSL+Tgf7ecuL2qDK26h1Fa8lw==
X-Received: by 2002:a17:902:7c17:b0:186:9fc8:6688 with SMTP id
 x23-20020a1709027c1700b001869fc86688mr9651947pll.22.1668616830748; 
 Wed, 16 Nov 2022 08:40:30 -0800 (PST)
Received: from [10.201.49.36] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.googlemail.com with ESMTPSA id
 m15-20020a656a0f000000b0045dc85c4a5fsm9854674pgu.44.2022.11.16.08.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 08:40:26 -0800 (PST)
Message-ID: <2e28461c-d0f1-6026-9717-e90cce87a991@redhat.com>
Date: Wed, 16 Nov 2022 17:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Alberto Faria <afaria@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-3-eesposit@redhat.com>
 <197f2a27-4c3f-a62b-535c-d1db9ba22a32@yandex-team.ru>
 <88f02d19-84d8-d1a7-4250-416fd32f1435@redhat.com>
 <711f6d68-888e-bca0-972e-a05503a039c5@yandex-team.ru>
 <460d096e-c642-166c-a4fd-77f953bfe33a@redhat.com>
 <CABgObfazW2eiiyffz_odFmbQXx8-Yu7fi1RdDwxKOEzocp0Eeg@mail.gmail.com>
 <15a00149-a6b2-3d03-db56-d05f3906196f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <15a00149-a6b2-3d03-db56-d05f3906196f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/15/22 16:41, Emanuele Giuseppe Esposito wrote:
> To sum up on what was discussed in this serie, I don't really see any
> strong objection against these patches, so I will soon send v3 which is
> pretty much the same except for patch 1, which will be removed.
> 
> I think these patches are useful and will be even more meaningful to the
> reviewer when in the next few days I send all the rwlock patches.

Yes, I agree.

FWIW I implemented path search in vrc and it found 133 candidates 
(functions that are only called by coroutine_fn are not coroutine_fns 
themselves).  I only list them after the signature because as expected, 
most of them are pointless; however there are some are obviously correct:

1) some have _co_ in their name :)

2) these five directly call a generated_co_wrapper so they're an easy catch:

vhdx_log_write_and_flush    -> bdrv_flush
vhdx_log_write_and_flush    -> bdrv_pread
vhdx_log_write_and_flush    -> bdrv_pwrite
mirror_flush                -> blk_flush
qcow2_check_refcounts       -> bdrv_pwrite
qcow2_check_refcounts       -> bdrv_pwrite_sync
qcow2_check_refcounts       -> bdrv_pread
qcow2_read_extensions       -> bdrv_pread
check_directory_consistency -> bdrv_pwrite

(vrc lets me query this with "paths [coroutine_fn_candidate] 
[no_coroutine_fn]")

3) I can also query (with "paths [coroutine_fn_candidate] ... 
[no_coroutine_fn]") those that end up calling a generated_co_wrapper. 
Among these, vrc catches block_copy_reset_unallocated from this patch:

block_copy_reset_unallocated
block_crypto_co_create_generic
calculate_l2_meta
check_directory_consistency
commit_direntries
commit_one_file
is_zero
mirror_flush
qcow2_alloc_bytes
qcow2_alloc_cluster_abort
qcow2_alloc_clusters_at
qcow2_check_refcounts
qcow2_get_last_cluster
qcow2_read_extensions
qcow2_read_snapshots
qcow2_truncate_bitmaps_check
qcow2_update_options
vhdx_log_write_and_flush
vmdk_is_cid_valid
zero_l2_subclusters

Another possibility is to identify common "entry points" in the paths to 
the no_coroutine_fn and make them generated_co_wrappers.  For example in 
qcow2 these include bitmap_list_load, update_refcount and 
get_cluster_table and the qcow2_snapshot_* functions.

Of course the analysis would have to be rerun after doing every change.

The most time consuming part is labeling coroutine_fn/no_coroutine_fn, 
which would be useful to do with clang (and at this point you might as 
well extract the CFG with it).  Doing the queries totally by hand 
doesn't quite scale (for example vrc's blind spot is inlining and I 
forgot to disable it, but I only noticed too late...), but it should be 
scriptable since after all VRC is just a Python package + a nice CLI.

Thanks,

Paolo



label coroutine_fn_candidate aio_get_thread_pool
label coroutine_fn_candidate aio_task_pool_free
label coroutine_fn_candidate aio_task_pool_status
label coroutine_fn_candidate bdrv_bsc_fill
label coroutine_fn_candidate bdrv_bsc_invalidate_range
label coroutine_fn_candidate bdrv_bsc_is_data
label coroutine_fn_candidate bdrv_can_write_zeroes_with_unmap
label coroutine_fn_candidate bdrv_check_request
label coroutine_fn_candidate bdrv_dirty_bitmap_get
label coroutine_fn_candidate bdrv_dirty_bitmap_get_locked
label coroutine_fn_candidate bdrv_dirty_bitmap_lock
label coroutine_fn_candidate bdrv_dirty_bitmap_next_dirty_area
label coroutine_fn_candidate bdrv_dirty_bitmap_next_zero
label coroutine_fn_candidate bdrv_dirty_bitmap_set_inconsistent
label coroutine_fn_candidate bdrv_dirty_bitmap_status
label coroutine_fn_candidate bdrv_dirty_bitmap_truncate
label coroutine_fn_candidate bdrv_dirty_bitmap_unlock
label coroutine_fn_candidate bdrv_dirty_iter_free
label coroutine_fn_candidate bdrv_dirty_iter_new
label coroutine_fn_candidate bdrv_dirty_iter_next
label coroutine_fn_candidate bdrv_has_readonly_bitmaps
label coroutine_fn_candidate bdrv_inc_in_flight
label coroutine_fn_candidate bdrv_min_mem_align
label coroutine_fn_candidate bdrv_pad_request
label coroutine_fn_candidate bdrv_probe_all
label coroutine_fn_candidate bdrv_reset_dirty_bitmap_locked
label coroutine_fn_candidate bdrv_round_to_clusters
label coroutine_fn_candidate bdrv_set_dirty
label coroutine_fn_candidate bdrv_set_dirty_iter
label coroutine_fn_candidate bdrv_write_threshold_check_write
label coroutine_fn_candidate blk_check_byte_request
label coroutine_fn_candidate blkverify_err
label coroutine_fn_candidate block_copy_async
label coroutine_fn_candidate block_copy_call_cancel
label coroutine_fn_candidate block_copy_call_cancelled
label coroutine_fn_candidate block_copy_call_failed
label coroutine_fn_candidate block_copy_call_finished
label coroutine_fn_candidate block_copy_call_free
label coroutine_fn_candidate block_copy_call_status
label coroutine_fn_candidate block_copy_call_succeeded
label coroutine_fn_candidate block_copy_reset_unallocated
label coroutine_fn_candidate block_copy_set_skip_unallocated
label coroutine_fn_candidate block_crypto_co_create_generic
label coroutine_fn_candidate BlockDriver.bdrv_aio_flush
label coroutine_fn_candidate BlockDriver.bdrv_aio_ioctl
label coroutine_fn_candidate BlockDriver.bdrv_aio_pdiscard
label coroutine_fn_candidate BlockDriver.bdrv_aio_preadv
label coroutine_fn_candidate BlockDriver.bdrv_aio_pwritev
label coroutine_fn_candidate BlockDriver.bdrv_co_drain_end
label coroutine_fn_candidate block_job_ratelimit_get_delay
label coroutine_fn_candidate block_job_ratelimit_get_delay
label coroutine_fn_candidate block_status
label coroutine_fn_candidate calculate_l2_meta
label coroutine_fn_candidate check_directory_consistency
label coroutine_fn_candidate commit_direntries
label coroutine_fn_candidate commit_one_file
label coroutine_fn_candidate count_single_write_clusters
label coroutine_fn_candidate iov_send_recv
label coroutine_fn_candidate is_allocated_sectors
label coroutine_fn_candidate iscsi_allocmap_is_allocated
label coroutine_fn_candidate iscsi_allocmap_is_valid
label coroutine_fn_candidate iscsi_allocmap_update
label coroutine_fn_candidate iscsi_populate_target_desc
label coroutine_fn_candidate is_sector_request_lun_aligned
label coroutine_fn_candidate is_zero
label coroutine_fn_candidate job_cancel_requested
label coroutine_fn_candidate job_enter
label coroutine_fn_candidate job_is_cancelled
label coroutine_fn_candidate job_progress_increase_remaining
label coroutine_fn_candidate job_progress_set_remaining
label coroutine_fn_candidate job_progress_update
label coroutine_fn_candidate job_transition_to_ready
label coroutine_fn_candidate mirror_flush
label coroutine_fn_candidate mirror_perform
label coroutine_fn_candidate nbd_client_will_reconnect
label coroutine_fn_candidate nbd_client_will_reconnect
label coroutine_fn_candidate nbd_err_lookup
label coroutine_fn_candidate nbd_errno_to_system_errno
label coroutine_fn_candidate nbd_iter_channel_error
label coroutine_fn_candidate nfs_file_co_create
label coroutine_fn_candidate nvme_get_free_req
label coroutine_fn_candidate nvme_put_free_req_and_wake
label coroutine_fn_candidate pstrcat
label coroutine_fn_candidate qapi_event_send_quorum_failure
label coroutine_fn_candidate qcow2_alloc_bytes
label coroutine_fn_candidate qcow2_alloc_cluster_abort
label coroutine_fn_candidate qcow2_alloc_clusters_at
label coroutine_fn_candidate qcow2_check_refcounts
label coroutine_fn_candidate qcow2_check_vmstate_request
label coroutine_fn_candidate qcow2_get_last_cluster
label coroutine_fn_candidate qcow2_read_extensions
label coroutine_fn_candidate qcow2_read_snapshots
label coroutine_fn_candidate qcow2_truncate_bitmaps_check
label coroutine_fn_candidate qcow2_update_options
label coroutine_fn_candidate qcrypto_block_decrypt
label coroutine_fn_candidate qcrypto_block_encrypt
label coroutine_fn_candidate qdict_rename_keys
label coroutine_fn_candidate qed_alloc_l2_cache_entry
label coroutine_fn_candidate qed_alloc_table
label coroutine_fn_candidate qed_commit_l2_cache_entry
label coroutine_fn_candidate qed_set_used_clusters
label coroutine_fn_candidate qemu_blockalign0
label coroutine_fn_candidate qemu_coroutine_enter_if_inactive
label coroutine_fn_candidate qemu_iovec_clone
label coroutine_fn_candidate qemu_iovec_compare
label coroutine_fn_candidate qemu_iovec_init_slice
label coroutine_fn_candidate qemu_iovec_is_zero
label coroutine_fn_candidate qemu_iovec_subvec_niov
label coroutine_fn_candidate qemu_iovec_to_buf
label coroutine_fn_candidate qemu_rbd_co_create
label coroutine_fn_candidate qio_channel_readv
label coroutine_fn_candidate qio_channel_readv_all
label coroutine_fn_candidate qio_channel_readv_all_eof
label coroutine_fn_candidate quorum_copy_qiov
label coroutine_fn_candidate quorum_report_bad_acb
label coroutine_fn_candidate quorum_vote_error
label coroutine_fn_candidate reqlist_find_conflict
label coroutine_fn_candidate reqlist_init_req
label coroutine_fn_candidate rule_check
label coroutine_fn_candidate throttle_account
label coroutine_fn_candidate tracked_request_set_serialising
label coroutine_fn_candidate vhdx_block_translate
label coroutine_fn_candidate vhdx_log_write_and_flush
label coroutine_fn_candidate vhdx_metadata_entry_le_export
label coroutine_fn_candidate vhdx_metadata_header_le_export
label coroutine_fn_candidate vhdx_region_entry_le_export
label coroutine_fn_candidate vhdx_region_header_le_export
label coroutine_fn_candidate vhdx_update_bat_table_entry
label coroutine_fn_candidate vmdk_is_cid_valid
label coroutine_fn_candidate warn_reportf_err
label coroutine_fn_candidate yank_register_function
label coroutine_fn_candidate zero_l2_subclusters


