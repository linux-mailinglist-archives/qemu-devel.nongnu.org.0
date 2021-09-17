Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138F340F415
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:26:12 +0200 (CEST)
Received: from localhost ([::1]:36408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9CF-0001rO-4I
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mR93c-0003g4-5s
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:17:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mR93X-0001Iz-EJ
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631866629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YjAhy4etJLYI7E4SySbNL/8/zzcpiPNLbp4/8iVqvL4=;
 b=SN8AF1KarRjeAhUf+ai4zcQQS9qKyJ+SR5rihXB1NuFpVN70hBX/TDHveE38M068rdv6kz
 ZrqhCz96+RG5vXKMQGYz7rHG6ur/Malhn2OS508k1uikXA8RZV4NeC48QpUE/w7BcSvA8Q
 FfZBz7Dw2+WElW4ay/IiZTebjzSe3uY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-G9AmK7BQNySK8AZuJiXqQw-1; Fri, 17 Sep 2021 04:17:08 -0400
X-MC-Unique: G9AmK7BQNySK8AZuJiXqQw-1
Received: by mail-ed1-f70.google.com with SMTP id
 14-20020a508e0e000000b003d822ac0581so47611edw.22
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 01:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=YjAhy4etJLYI7E4SySbNL/8/zzcpiPNLbp4/8iVqvL4=;
 b=f/4FerrlWLynOHtSu39tqhJ0oj8Ka0CDziZXGM3Hz9ZnxyaK4bN94lroODQplUODje
 pXe3+dfZ+FAoT7EunD8F9WISCtZrkbUojG3uHnEc/CO7I5Zkt2HtB0CucGWnhQCoQpXr
 IQiRo3YROqqlPAOr3DQ8r24PAnm5liLILjuYA2qPE/5bKeMwOnhNus+51V9kp3u2s+7H
 mrdpuK97tXEGY/rFl4pyJMjfU+z90kqWfvLqfVL+GjMh8uJ5QiQEiLxcPDrdRBdU23L6
 oIKqOFccb3/0E4LqbrMbYM+dq5ysBfXFOfcGgOYQsPHJ/1OOhrEw1LYVKM33Zwr3xdeb
 Om6w==
X-Gm-Message-State: AOAM533nuje0feD7cSZGYnAVTWAbFjWBd/B98jKb77BGOuk6MjmtF1uU
 Nr7uHh3dj9Gd2Ej+ZZbGqhDBIN5Jp4GSIcIs/QfSnQSXyqSEcMkhdj4kDEMvEjQWremzQeyL4BU
 BAK0d4U5xPRvb9RE=
X-Received: by 2002:aa7:c9cd:: with SMTP id i13mr11395546edt.178.1631866627261; 
 Fri, 17 Sep 2021 01:17:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9poZ4JKtkQCVqvYKvtMkuAyU51Yb2cS+hxRb/gEjEl6JC2ms1FGC0DhsJ3+PZm+gfHABHQg==
X-Received: by 2002:aa7:c9cd:: with SMTP id i13mr11395533edt.178.1631866627072; 
 Fri, 17 Sep 2021 01:17:07 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id c5sm2328927edx.81.2021.09.17.01.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 01:17:06 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/8] i386: Assorted KVM PV and Hyper-V feature
 improvements
In-Reply-To: <20210902093530.345756-1-vkuznets@redhat.com>
References: <20210902093530.345756-1-vkuznets@redhat.com>
Date: Fri, 17 Sep 2021 10:17:06 +0200
Message-ID: <87a6kbboql.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, Vadim Rozenfeld <vrozenfe@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

> This is a continuation of "[PATCH 0/3] i386/kvm: Paravirtualized features usage 
> enforcement" series, thus v2.
>
> This series implements several unrelated features but as there are code
> dependencies between them I'm sending it as one series.
>
> PATCH1 adds empty 6.2 machine types and the required compat infrastructure
> (to be used by PATCH8)
> PATCH2 adds documentation for KVM PV features
> PATCH3 adds support for KVM_CAP_ENFORCE_PV_FEATURE_CPUID
> PATCH4 adds support for KVM_CAP_HYPERV_ENFORCE_CPUID
> PATCHes5-6 add 'hv-avic' feature
> PATCH7 makes Hyper-V version info settable
> PATCH8 changes the default Hyper-V version to 2016

Eduardo, Paolo, all,

any comments? It seems patches can still be applied to 'master' with no
issues.

-- 
Vitaly


