Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A97544F93
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:38:23 +0200 (CEST)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJIk-0000zt-4Y
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzHeQ-0004wr-EG
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:52:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzHeM-0003eK-S0
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654779153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=evZBmM6sS9XAByNzHugKAfc6aInwC6+ga4zHkuhejjM=;
 b=DVHSuzhDoTuWiYfsU+oEsOmBxXqN83DQTQQARnhHNGwssFeD18TzvgjaxFQ3YEoH1rnCNi
 /ReY5lIOPBSmDat+UvclQ1hNmmpecGNZ5MkabXwRP2/JY9/2/F4izDNI0x1uXK6rJ6+ehn
 JDpgaa7veCRWUFvEOIb03smp6QGVrTo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-PC9cOwPIMN-YgMBhAPXdQQ-1; Thu, 09 Jun 2022 08:52:32 -0400
X-MC-Unique: PC9cOwPIMN-YgMBhAPXdQQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 bv8-20020a0560001f0800b002183c5d5c26so3406957wrb.20
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 05:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=evZBmM6sS9XAByNzHugKAfc6aInwC6+ga4zHkuhejjM=;
 b=PC2yWdsbXZCTOMOkW5Us0DIw0db4C/qG5A0HDMicTuFSPCY1bWwpg8Fg8D9gQ1+KBr
 LrHwQryS80BSo3u7dKy5FaQWxmiy5isUctEiM/PJAw43Zn79sWWArgjVpRNH5mdoEGpX
 8zhpDeOwJrwGz7BmcIaEsjGnJKzl+tQtoihPEoVHEnV13wXyKH0u7CZ30kHzLVzG5Vy4
 chUdynNKAy1ba0ysUPCF1cTo/O3IBKdG0n5nm7A1FGLZTgN2iAhX+dDa3MzmFe5gTCg1
 9Ofh0bfTzEY7rSjs42F1uL6WG9A2uEXdDnX4rsiN729yP6dcMK1jX9T9umC5WmMDTjMy
 iFkw==
X-Gm-Message-State: AOAM531VoYJ9YrpuNY3j9NXyMJI3Kfwk7FqHQR1fAa8R3H0QMAUkxHUA
 NOxkrptFLtrjWOJ6j5IaK76/f6xFX9j3bz5K7lVA45eUhJVuqb9j5L6daGGnetlt7RPZzOFZQUf
 FwjkR6xS7EQvNC7k=
X-Received: by 2002:a5d:4344:0:b0:20c:cad4:9e9b with SMTP id
 u4-20020a5d4344000000b0020ccad49e9bmr37894335wrr.187.1654779151263; 
 Thu, 09 Jun 2022 05:52:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMlcEIw55gEuwFdCfRPvVm6I3dZCwAJVrxgYydVs6fONIaKld4m7LfUjQsts3tkdiaNKus8A==
X-Received: by 2002:a5d:4344:0:b0:20c:cad4:9e9b with SMTP id
 u4-20020a5d4344000000b0020ccad49e9bmr37894302wrr.187.1654779151034; 
 Thu, 09 Jun 2022 05:52:31 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c4f8800b0039c325eaff2sm24827079wmq.26.2022.06.09.05.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:52:30 -0700 (PDT)
Date: Thu, 9 Jun 2022 13:52:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 15/18] qapi: introduce x-query-ramblock QMP command
Message-ID: <YqHtDN/+DNUpB/ve@work-vm>
References: <20211102175700.1175996-1-berrange@redhat.com>
 <20211102175700.1175996-16-berrange@redhat.com>
 <073c1687-d30f-8f41-b87e-83372137708a@suse.de>
 <YqHJKgA5OG80dljx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqHJKgA5OG80dljx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Jun 09, 2022 at 12:07:31PM +0200, Claudio Fontana wrote:
> > Hello all,
> > 
> > it would be really good to be able to rely on this command or something similar,
> > to be able to know the approximate size of a migration before starting it.
> > 
> > in QEMU ram_bytes_total() returns what I would like to have,
> > but there is currently no QMP way to get it without starting a migration,
> > which when trying to optimize it/size it is just about too late.
> 
> Aside from the main VM RAM, what other RAM blocks are likely to have
> a size large enough to be of consequence to the live migration
> data copy, and whose size is not already known to the mgmt app from
> the guest config choices it made ? VGA RAM could be a few 100MB I
> guess, but the mgmt app knows about that. I've always assumed everything
> else is just noise in comparison to the main RAM region.
> 
> Still I wonder how useful this is as its just a static figure, and the
> problems with migration transfer are the bulking up of data when the
> VM is repeatedly dirtying stuff at a high rate.
> 
> > Do you think x-query-ramblock could be promoted to non-experimental?
> 
> It would have to be re-written, as this current impl is just emitting
> a huge printf formatted string. To be considered supportable, the data
> would have to be formally modelled in QAPI instead.
> 
> IOW, it would be a case of introducing a new command that emits formal
> data, convertintg 'info ramblock' to use that, and then deprecating this 
> x-query-ramblock.
> 
> > Should another one be made available instead, like :
> > query-ram-bytes-total ?
> 
> That would be simpler if you're just wanting it to give a single
> figure.

Is this what qmp_query_memory_size_summary does?

Dave

> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


