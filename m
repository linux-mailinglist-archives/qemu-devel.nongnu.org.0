Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892E267CD63
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:16:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL33N-0006td-UZ; Thu, 26 Jan 2023 09:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pL33L-0006tU-SN
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:16:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pL33K-0006ii-Hq
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674742593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xp9QBeld717KsTDKw/ILMgnHH9pjDskMHfcGd8b49qU=;
 b=L9dyyFCWlRwvJ8nAhpIrGDtOl+mLRGKdU2UNKiKsy4+wU1DAYCpD1P/HSCMwBKcSLiVgH5
 E90afXYW3KM14e22XgBG5IekSbK7Xro5YTK04YtlzUo2O+awfkexSXooK5yPcF5QSDtlOp
 4nV20KHFKyEOM3IkU4B8fRXuNxrn3O0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-CrZrZ8RQPwGZPxkwWbEyzQ-1; Thu, 26 Jan 2023 09:15:20 -0500
X-MC-Unique: CrZrZ8RQPwGZPxkwWbEyzQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adfe4cf000000b002bf9413bc50so338675wrm.16
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 06:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xp9QBeld717KsTDKw/ILMgnHH9pjDskMHfcGd8b49qU=;
 b=c5CGFDMDCEOs4924IkliO4kqhd9bOP3dClEpUeFg+0J3o/QjexbGKcW/pR8Kn9fyId
 l9LdvpZAZtS1F0bfyVcTpGLg4uQ5zz7n6ArYBsUlmBN+22c7U4P5hCpTytsZBLhjGCKM
 HCnqNItBb8mrPX4/XbdrGZyjM5fp0Q2fW36oBV1PqgPkX5A+MvzjJE1FcGbYbZle5ArT
 gqCtj1uXBmBzM6OUH8TR9mXAGMp648n6/JGXGHmzph7RmWGQ3sbj2iGuZgPpqd/bfXe0
 +++6WYWZOxFhRbXqc1ZXX6cRAgO7yc27EZxolS9WUDVd7HTnzHuT+4nkGRy2KPw/ENhm
 u5QA==
X-Gm-Message-State: AFqh2kq6XWyejxGYGcTUEPZ2hKRr4keWzJTpHyATdze6U3JOvOsi2iss
 Sptl9O0DO/sItMdry8+Uq4MhUJFQ7xOmK8cEXImHWI7Pwsko8qkCRocnsZiV6CrqAcIdOVdgck6
 5pZsJbkVlbnZQiEs=
X-Received: by 2002:a05:600c:538e:b0:3da:516:19ed with SMTP id
 hg14-20020a05600c538e00b003da051619edmr35083484wmb.29.1674742514140; 
 Thu, 26 Jan 2023 06:15:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtczbTSluIvvLd7Vi8lJ5n0len8h2tZzIm4TSLxykrLm+9lq4JX2oDLZEpRVUtWfTLjquBC4g==
X-Received: by 2002:a05:600c:538e:b0:3da:516:19ed with SMTP id
 hg14-20020a05600c538e00b003da051619edmr35083470wmb.29.1674742513929; 
 Thu, 26 Jan 2023 06:15:13 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 u32-20020a05600c4d2000b003db0659c454sm1791717wmp.32.2023.01.26.06.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:15:13 -0800 (PST)
Date: Thu, 26 Jan 2023 14:15:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michal =?iso-8859-1?B?UHLtdm96bu1r?= <mprivozn@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9KK72k8dZU7Ccau@work-vm>
References: <20230125224016.212529-1-peterx@redhat.com>
 <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

* Michal Prívozník (mprivozn@redhat.com) wrote:
> On 1/25/23 23:40, Peter Xu wrote:
> > The new /dev/userfaultfd handle is superior to the system call with a
> > better permission control and also works for a restricted seccomp
> > environment.
> > 
> > The new device was only introduced in v6.1 so we need a header update.
> > 
> > Please have a look, thanks.
> 
> I was wondering whether it would make sense/be possible for mgmt app
> (libvirt) to pass FD for /dev/userfaultfd instead of QEMU opening it
> itself. But looking into the code, libvirt would need to do that when
> spawning QEMU because that's when QEMU itself initializes internal state
> and queries userfaultfd caps.

You also have to be careful about what the userfaultfd semantics are; I
can't remember them - but if you open it in one process and pass it to
another process, which processes address space are you trying to
monitor?

Dave

> Michal
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


