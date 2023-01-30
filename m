Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583D86805B7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:45:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMyv-0006do-KD; Mon, 30 Jan 2023 00:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMyt-0006de-Lt
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMyr-0006C6-V9
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675057525;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NPI0QUnw5tzdzGuSIaMAPVjZWbM6LcFSZFksrcdoi9g=;
 b=O4jheb+iaP9N4ZDq4YFF1iuclTOvTYuRjgLKwczjFz9et1xhR/w316GY4llFVFb9d9/Gpn
 /VdmAe+6ZpAVHwn8Qe/hB5XztQ4mPdjkzWMSdDQMPqzUDAo5zbp3A9XB4avNh+5Q7bI1/G
 14kv+LRLNuLQxqcxHlkCUUWOGb1bEPw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-538-KZpvkHdNMTag5eTYbkmung-1; Mon, 30 Jan 2023 00:45:23 -0500
X-MC-Unique: KZpvkHdNMTag5eTYbkmung-1
Received: by mail-wm1-f72.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso289930wms.8
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:45:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPI0QUnw5tzdzGuSIaMAPVjZWbM6LcFSZFksrcdoi9g=;
 b=tkNgxdJMu4l6DE3HY/S/YNra+oF4xaWaAvFotca/7OOuHrkN6zwrxWkgd8u2TRUUb2
 8RNPirm6wcd17Jpw+V59D+otZjEQA8OcGstcay3Ynh8Smia44tzMQoqCjGYiNeC5ZCe/
 ma3kqQkxHfC+asxDMlAPEtWAw2VkpeRn8AAuud54yDITMRhYV2ivsEeSdR5ahSJvt+XV
 6TgboledOjq3gN1O8/pqX+efuh3XfWNl8Ebeu2HxGWJx2q110BXKtL/EzXkiL7Ymw9sJ
 dlicfoipvzYlW7JDfUMfGKAMj1pZBcym4Rz91zooefbc7I+iZViEJx7V2oZ+WkKJQ8xO
 S7rQ==
X-Gm-Message-State: AFqh2kpE/aG+zk47qlu2mTS46flllar1tKDeYCVjfAaa6YFKTTEd14cJ
 D8S/Sbr+qLsFqLU9IyuM8C12Brl8xtNtCZJ563meLDG/eA25SDKHJyP0KzZNXhzoHzlcZwLvnRT
 86lLk7P8Zt8EXCno=
X-Received: by 2002:a05:600c:225a:b0:3d3:5c21:dd99 with SMTP id
 a26-20020a05600c225a00b003d35c21dd99mr47769945wmm.18.1675057522346; 
 Sun, 29 Jan 2023 21:45:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvl4XD/3x/27yRqZcTR+uYsQ2lEVCH7w7gf3WwKz3a7X2z2MkKhYa6EYO6Mjcrfyoh1dB8bNQ==
X-Received: by 2002:a05:600c:225a:b0:3d3:5c21:dd99 with SMTP id
 a26-20020a05600c225a00b003d35c21dd99mr47769938wmm.18.1675057522134; 
 Sun, 29 Jan 2023 21:45:22 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 ay6-20020a05600c1e0600b003db00747fdesm15246784wmb.15.2023.01.29.21.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:45:21 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 15/21] migration: Teach qemu about minor faults and
 doublemap
In-Reply-To: <20230117220914.2062125-16-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:08 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-16-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:45:20 +0100
Message-ID: <87k014pocv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> When a ramblock is backed by hugetlbfs and the user specified using
> double-map feature, we trap the faults on these regions using minor mode.
> Teach QEMU about that.
>
> Add some sanity check on the fault flags when receiving a uffd message.
> For minor fault trapped ranges, we should always see the MINOR flag set,
> while when using generic missing faults we should never see it.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



> -    if (!(reg_struct.ioctls & ((__u64)1 << _UFFDIO_COPY))) {

Does qemu have a macro to do this bitmap handling?

>  {
>      MigrationIncomingState *mis = opaque;
>      struct uffd_msg msg;
> +    uint64_t address;
>      int ret;
>      size_t index;
>      RAMBlock *rb = NULL;
> @@ -945,6 +980,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
>      }
>  
>      while (true) {
> +        bool use_minor_fault, minor_flag;

I think that something on the lines of:
           bool src_minor_fault, dst_minor_fault;

will make things simpler.  Reviewing, I have to go back to definition
place to know which is which.

>          ram_addr_t rb_offset;
>          int poll_result;
>  
> @@ -1022,22 +1058,37 @@ static void *postcopy_ram_fault_thread(void *opaque)
>                  break;
>              }
>  
> -            rb_offset = ROUND_DOWN(rb_offset, migration_ram_pagesize(rb));
> -            trace_postcopy_ram_fault_thread_request(msg.arg.pagefault.address,
> -                                                qemu_ram_get_idstr(rb),
> -                                                rb_offset,
> -                                                msg.arg.pagefault.feat.ptid);
> -            mark_postcopy_blocktime_begin(
> -                    (uintptr_t)(msg.arg.pagefault.address),
> -                                msg.arg.pagefault.feat.ptid, rb);
> +            address = ROUND_DOWN(msg.arg.pagefault.address,
> +                                 migration_ram_pagesize(rb));
> +            use_minor_fault = postcopy_use_minor_fault(rb);
> +            minor_flag = !!(msg.arg.pagefault.flags &
> +                            UFFD_PAGEFAULT_FLAG_MINOR);
>  
> +            /*
> +             * Do sanity check on the message flags to make sure this is
> +             * the one we expect to receive.  When using minor fault on
> +             * this ramblock, it should _always_ be set; when not using
> +             * minor fault, it should _never_ be set.
> +             */
> +            if (use_minor_fault ^ minor_flag) {
> +                error_report("%s: Unexpected page fault flags (0x%"PRIx64") "
> +                             "for address 0x%"PRIx64" (mode=%s)", __func__,
> +                             (uint64_t)msg.arg.pagefault.flags,
> +                             (uint64_t)msg.arg.pagefault.address,
> +                             use_minor_fault ? "MINOR" : "MISSING");
> +            }
> +
> +            trace_postcopy_ram_fault_thread_request(
> +                address, qemu_ram_get_idstr(rb), rb_offset,
> +                msg.arg.pagefault.feat.ptid);
> +            mark_postcopy_blocktime_begin(
> +                    (uintptr_t)(address), msg.arg.pagefault.feat.ptid, rb);
>  retry:
>              /*
>               * Send the request to the source - we want to request one
>               * of our host page sizes (which is >= TPS)
>               */
> -            ret = postcopy_request_page(mis, rb, rb_offset,
> -                                        msg.arg.pagefault.address);
> +            ret = postcopy_request_page(mis, rb, rb_offset, address);

This is the only change that I find 'problematic'.
On old code, rb_offset has been ROUND_DOWN, on new code it is not.
On old code we pass msg.arg.pagefault.address, now we use
ROUND_DOW(msg.arg.pagefault.address, mighration_ram_pagesize(rb)).

>              if (ret) {
>                  /* May be network failure, try to wait for recovery */
>                  postcopy_pause_fault_thread(mis);
> @@ -1694,3 +1745,13 @@ void *postcopy_preempt_thread(void *opaque)
>  
>      return NULL;
>  }
> +
> +/*
> + * Whether we should use MINOR fault to trap page faults?  It will be used
> + * when doublemap is enabled on hugetlbfs.  The default value will be
> + * false, which means we'll keep using the legacy MISSING faults.
> + */
> +bool postcopy_use_minor_fault(RAMBlock *rb)
> +{
> +    return migrate_hugetlb_doublemap() && qemu_ram_is_hugetlb(rb);
> +}

Are you planing using this function outside postocpy-ram.c?  Otherwise
if you move up its definition you can make it static and drop the header
change.

Later, Juan.


