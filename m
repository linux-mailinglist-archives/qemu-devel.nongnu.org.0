Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109D66D762
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:00:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHgsH-0008Dv-NK; Tue, 17 Jan 2023 02:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHgsF-0008Df-Sm
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:59:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHgsE-0007YW-9a
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673942353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvbMlHIKaDk7YTnG10u16GlXXt4ZSfZAi3fdeuX/FOk=;
 b=ADXQwE6WFVrMKefCAgoTlcu8qBNwHqB28H3K3/Jt/VTnmKBUAJ2Rpn+8KCp4lsdr2I4Y3d
 odc3aZkfT/QRoPBM6xVR/C6UShuYqYt1AlFGB5GF+jc2d8kQB/rrnIAjS8Roqem0QZMCJo
 pjWLtwlVvGkk0bAz+KTshYPC2AkiH20=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-xp5eYiopN7OufcgnknORhw-1; Tue, 17 Jan 2023 02:59:11 -0500
X-MC-Unique: xp5eYiopN7OufcgnknORhw-1
Received: by mail-qt1-f198.google.com with SMTP id
 k7-20020ac84747000000b003a87ca26200so13498314qtp.6
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 23:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UvbMlHIKaDk7YTnG10u16GlXXt4ZSfZAi3fdeuX/FOk=;
 b=eXv7FDxCSAqmmgoen5ONX9UKOILOoU3ydxH4rjhMbeME1jIz18Kne3Ze9ij9WGza6e
 2rRTkXdE2ZX+U/VCTx9M8tW70uVRo1ePyJ3YQAZtBat6kUHDbVtbB8P+rB+NQIZ/8e8m
 Ga18MwyqjD73WWUByXAGpR23x8zKB8q65qViR+Huvh2e4tQuIWgcEY3z1YVp5CtPfmsS
 mkutuNQW6UlK6qubOUQ/s05tDerMVmadSPNZc9T9dhy1Zivx3W+y3M/JZ1yJOciVL0Ue
 LLZ6FoBB1kH9oBE6139OujaBkWCEhQ9O/dM5AiA6uQLgp6s15YE3kKJc324ZIHNYloxJ
 94oA==
X-Gm-Message-State: AFqh2kpx7oW3hwuQvnfKuSZwtPIwyy14Y5rxw2gIqPJyALDFhdplR7+a
 R3zaFa7OWEuVNIXZ5X4YeSyI1Fyo8hDRYJnzS2gWOhRkJyZk0bjWLw7+OMOvEbF3WCk+3Ua1YJK
 MTl3+zxOLJkqo9o0=
X-Received: by 2002:a05:622a:1e1b:b0:3b4:a6af:a2f2 with SMTP id
 br27-20020a05622a1e1b00b003b4a6afa2f2mr2683611qtb.34.1673942351353; 
 Mon, 16 Jan 2023 23:59:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsFFDyMcrRqXJeu+FEeghBbyVbzR+aQolrhIUOPcAmUjJbcaMP5TnkRMpnscY2hIaHV+SplNQ==
X-Received: by 2002:a05:622a:1e1b:b0:3b4:a6af:a2f2 with SMTP id
 br27-20020a05622a1e1b00b003b4a6afa2f2mr2683585qtb.34.1673942351072; 
 Mon, 16 Jan 2023 23:59:11 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-26.web.vodafone.de.
 [109.43.177.26]) by smtp.gmail.com with ESMTPSA id
 z26-20020ac8101a000000b003a70a675066sm15603075qti.79.2023.01.16.23.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 23:59:10 -0800 (PST)
Message-ID: <dcfedca8-bec8-34d2-07c0-d53212e60456@redhat.com>
Date: Tue, 17 Jan 2023 08:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/3] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, frankja@linux.ibm.com,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Sebastian Mitterle
 <smitterl@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230116174607.2459498-1-clg@kaod.org>
 <20230116174607.2459498-3-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230116174607.2459498-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/01/2023 18.46, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> If a secure kernel is started in a non-protected VM, the OS will hang
> during boot without giving a proper error message to the user.
> 
> Perform the checks on Confidential Guest support at runtime with an
> helper called from the service call switching the guest to protected
> mode.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
> 
>    In s390_pv_check(), drop the call to s390_pv_guest_check() since
>    init time has already checked the same conditions. However, to
>    report an error when the machine is not protected and the kernel
>    secure, we still need s390_pv_check().

Basically Ack for this patch ... I'm just wondering whether we should maybe 
use a different name for the function. We now have s390_pv_guest_check() and 
390_pv_check() ... hard to distinguish. Maybe we should call them 
s390_pv_initial_check() and s390_pv_runtime_check() (or 
s390_pv_diag308_check()) or something similar instead?

  Thomas


