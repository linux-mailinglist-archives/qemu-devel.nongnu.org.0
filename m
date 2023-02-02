Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B69E687CA1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:47:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNY3B-0004bv-Jl; Thu, 02 Feb 2023 06:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY39-0004a6-Jb
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:46:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY37-0008K3-Nm
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675338400;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WwKUhTGrGILSgcKwKKDy+4F67EL0K19+Vi0vEgubBlQ=;
 b=QMG6hVqWlhvkMu2nKviSoWFyklfGIeKEaHZdU8n42Jks0N/j2bhyJWwi7t8q9h1UEN6uoX
 Eedyt0gSRUGnZRuW5xh4i2ssJJQ3HxBQqzp+OJgVU5Y0j4L3UXvDNUnOtTLsEYwCPb+xSz
 6diiHpylGItb935Z3Aou7VDlZycCH7Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-rns9HRmYN1er32Fe2xrtIA-1; Thu, 02 Feb 2023 06:46:39 -0500
X-MC-Unique: rns9HRmYN1er32Fe2xrtIA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o8-20020a05600c510800b003dfdf09ffc2so465517wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwKUhTGrGILSgcKwKKDy+4F67EL0K19+Vi0vEgubBlQ=;
 b=n45aTqgUm2VHsEtU3r5ZI17/NjxF/q+gTFxq/gM709ZLK01/040m/4RayjttZgFf3b
 vlMi5pQSVuFLtAl4ihiTfJO9VElvEM9U5Z46tXqvXI4m5zyrGLk8kjNYCKpVYS5vdDiG
 tOj1d5DpvX4E7bASWAiEW86MvvlKsy6zB6FZqozhQG8Y6HtUAnJGQ5C7S+H3W+DhZnL2
 wZ2hWnNsI+MopK4b3wWBr4TCNnW8hIlpXQrn5nv8hQM2eX6AXVeZjbww7j2Qcw/1VMiG
 HhYMrxTN1FDCGBX1+b2sX16T1GkkghbEcikFK+7EBgdFKfu+cgoieo0hUMB6zYLmbjCc
 K8hw==
X-Gm-Message-State: AO0yUKVu0jqwxITYMo1jRWyW4+J3zlxpPVyWhtof5P8bj1f2JupPbAQ8
 Y237JuKvz1nO/Zb+d116jI+Z0dxv/ZvbcTpBFBpDzWdBCTpPKeb0e8H8KzNFYDkrwvB/FjHOr+4
 A2abcXPa9/8J9LgQ=
X-Received: by 2002:a1c:7c19:0:b0:3df:d817:df98 with SMTP id
 x25-20020a1c7c19000000b003dfd817df98mr2080854wmc.10.1675338398215; 
 Thu, 02 Feb 2023 03:46:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8Ef2HfNbkvTmmjdtcjWJKhClvkijzho5NhxjeANesWhS90wsvKpXslVIVmCI0OOmu8qUQkAQ==
X-Received: by 2002:a1c:7c19:0:b0:3df:d817:df98 with SMTP id
 x25-20020a1c7c19000000b003dfd817df98mr2080838wmc.10.1675338397997; 
 Thu, 02 Feb 2023 03:46:37 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b002bdf3809f59sm19213234wrq.38.2023.02.02.03.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:46:37 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v5 1/8] migration/savevm: Move more savevm handling into
 vmstate_save()
In-Reply-To: <20230117112249.244096-2-david@redhat.com> (David Hildenbrand's
 message of "Tue, 17 Jan 2023 12:22:42 +0100")
References: <20230117112249.244096-1-david@redhat.com>
 <20230117112249.244096-2-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:46:36 +0100
Message-ID: <87a61wp9wj.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

David Hildenbrand <david@redhat.com> wrote:
> Let's move more code into vmstate_save(), reducing code duplication and
> preparing for reuse of vmstate_save() in qemu_savevm_state_setup(). We
> have to move vmstate_save() to make the compiler happy.
>
> We'll now also trace from qemu_save_device_state(), triggering the same
> tracepoints as previously called from
> qemu_savevm_state_complete_precopy_non_iterable() only. Note that
> qemu_save_device_state() ignores iterable device state, such as RAM,
> and consequently doesn't trigger some other trace points (e.g.,
> trace_savevm_state_setup()).
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


