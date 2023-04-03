Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989766D514E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 21:27:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjPpf-0003py-Tr; Mon, 03 Apr 2023 15:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjPpa-0003nu-Em
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjPpX-0003fZ-VT
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 15:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680550022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HbmMcByw3XM4bFNtAvTL4ZXQ3ymwSkRpNZY8xJJ+TBU=;
 b=DlkeHmJ3DYDwFqFrUXcCr1Il/SolXtHUBX31zNfWTFEDtOt7URUGMgpE8rP5FlqoVDf5rg
 bfhXDip0VzCG+XHqp/ti9uOcKLj/zfJ84XBMlxF9w4tzP1MylN2i8wKruz0hUyHXE1lFJ+
 uUCotzDEyMcTHVFwBaRgbMr0yAlhUvg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-x8Bf_a2rPq6pySz-6fi73Q-1; Mon, 03 Apr 2023 15:27:01 -0400
X-MC-Unique: x8Bf_a2rPq6pySz-6fi73Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 b142-20020ae9eb94000000b007486a8b9ae9so10985479qkg.11
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 12:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680550020;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HbmMcByw3XM4bFNtAvTL4ZXQ3ymwSkRpNZY8xJJ+TBU=;
 b=HDWOsv4lj1pDz8os+fRF/kxZDzASnkNui6qr1tWvP8jFn7/6Xucuo+guAiNtkxZnSc
 VNMN5hS0DGunKS1FbK3SoauraakBJqQ5YzJcXuFuu3ZnWdfTTXl+109X0AU3r5C9M0Fg
 GssieeF1Gjlf93wUSCri4Q0fl9I7BLmhmP6j6VRUl378Iq5eVfDdhVdCeJ2TxaxSWX7U
 xCMcHxEFYAOSgpE1kTPMnhxTrbY8mw6by+LBR4ClIdJRzVntve2Q93VQqDmUh4QTBm0Z
 dCHno2KCEDcdsdyHqlA/Gm37lrN3ifyH6YtfrZtnGkLodZ7yY5p0C8OF/hvOsRaL/1TI
 TNtQ==
X-Gm-Message-State: AAQBX9d9vUkumL8vm+6DlqEUmPrRC9DOnvkvsxF1Wjudwbbk2gfLGzoa
 TkwpfBnEdySVk6vn+FbTYvXhEuyrymg/2e+zroI/EQVDp46+CgVQcTYyQJCzVQYA1iyCvnRaNv4
 jRkUhnI3mHzTa03E=
X-Received: by 2002:a05:6214:301c:b0:5ab:28aa:2418 with SMTP id
 ke28-20020a056214301c00b005ab28aa2418mr24244347qvb.5.1680550020399; 
 Mon, 03 Apr 2023 12:27:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350a8lMpXnvoow0A3MAGMWXhiV0bo8R709wZMONK02evQmKg1ZQvW26oqpouG6A0L38kKkhlTpw==
X-Received: by 2002:a05:6214:301c:b0:5ab:28aa:2418 with SMTP id
 ke28-20020a056214301c00b005ab28aa2418mr24244322qvb.5.1680550020166; 
 Mon, 03 Apr 2023 12:27:00 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 b17-20020ae9eb11000000b00745c437b38dsm3024287qkg.82.2023.04.03.12.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 12:26:59 -0700 (PDT)
Date: Mon, 3 Apr 2023 15:26:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Fabiano Rosas <farosas@suse.de>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com, Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZCsogia3r7ePKBR9@x1n>
References: <ZCYCE0llX9WANK18@x1n> <87edp5oukh.fsf@suse.de>
 <ZCbzmZXz3JG/jElA@x1n> <878rfdos4a.fsf@suse.de>
 <ZCcCV8PIsuvab1lO@x1n> <ZCcF6I0qb+1xlPhJ@redhat.com>
 <ZCcKBDM9sLomGOQE@x1n> <875yagpywy.fsf@suse.de>
 <ZCdWJ59rqY6oScvg@x1n>
 <d2b40262-3791-8820-5104-e4eb313cd796@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d2b40262-3791-8820-5104-e4eb313cd796@suse.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi, Claudio,

Thanks for the context.

On Mon, Apr 03, 2023 at 09:47:26AM +0200, Claudio Fontana wrote:
> Hi, not sure if what is asked here is context in terms of the previous
> upstream discussions or our specific requirement we are trying to bring
> upstream.
>
> In terms of the specific requirement we are trying to bring upstream, we
> need to get libvirt+QEMU VM save and restore functionality to be able to
> transfer VM sizes of ~30 GB (4/8 vcpus) in roughly 5 seconds.  When an
> event trigger happens, the VM needs to be quickly paused and saved to
> disk safely, including datasync, and another VM needs to be restored,
> also in ~5 secs.  For our specific requirement, the VM is never running
> when its data (mostly consisting of RAM) is saved.
>
> I understand that the need to handle also the "live" case comes from
> upstream discussions about solving the "general case", where someone
> might want to do this for "live" VMs, but if helpful I want to highlight
> that it is not part of the specific requirement we are trying to address,
> and for this specific case won't also in the future, as the whole point
> of the trigger is to replace the running VM with another VM, so it cannot
> be kept running.

From what I read so far, that scenario suites exactly what live snapshot
would do with current QEMU - that at least should involve a snapshot on the
disks being used or I can't see how that can be live.  So it looks like a
separate request.

> The reason we are using "migrate" here likely stems from the fact that
> existing libvirt code currently uses QMP migrate to implement the save
> and restore commands.  And in my personal view, I think that reusing the
> existing building blocks (migration, multifd) would be preferable, to
> avoid having to maintain two separate ways to do the same thing.  That
> said, it could be done in a different way, if the performance can keep
> up. Just thinking of reducing the overall effort and also maintenance
> surface.

I would vaguely guess the performance can not only keep up but better than
what the current solution would provide, due to the possibility of (1)
batch handling of continuous guest pages, and (2) completely no dirty
tracking overhead.

For (2), it's not about wr-protect page faults or vmexits due to PML being
full (because vcpus will be stopped anyway..), it's about enabling the
dirty tracking (which already contains overhead, especially when huge pages
are enabled, to split huge pages in EPT pgtables) and all the bitmap
operations QEMU does during live migration even if the VM is not live.

IMHO reusing multifd may or may not be a good idea here, because it'll of
course also complicate multifd code, hence makes multifd harder to
maintain, while not in a good way, because as I mentioned I don't think it
can use much of what multifd provides.

I don't have a strong opinion on the impl (even though I do have a
preference..), but I think at least we should still check on two things:

  - Being crystal clear on the use case above, and double check whether "VM
    stop" should be the default operation at the start of the new cmd - we
    shouldn't assume the user will be aware of doing this, neither should
    we assume the user is aware of the performance implications.

  - Making sure the image layout is well defined, so:

    - It'll be extensible in the future, and,

    - If someone would like to refactor it to not use the migration thread
      model anymore, the image format, hopefully, can be easy to keep
      untouched so it can be compatible with the current approach.

Just my two cents. I think Juan should have the best grasp on this.

Thanks,

-- 
Peter Xu


