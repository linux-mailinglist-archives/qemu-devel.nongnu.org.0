Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB8247EB83
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 06:16:15 +0100 (CET)
Received: from localhost ([::1]:47990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0cwA-0007mL-8Q
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 00:16:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0cuX-000752-H9
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 00:14:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0cuW-0001Tj-5X
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 00:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640322871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNxzvN0Qar6P8nUL/xIycC1M4Bs97gE3YexLAe5fv9c=;
 b=BV1jsYFKbi2ll7JGO3AZAIvM1C2xSuqDPfIFRZMK1oeZlL7ReFjiR0FGmcHHkCPNVrLqyN
 g+wFx1qYGkpOXyfn6x+POVkix2ew0+4stP0VlbOShvOpm6oiCWhreuAmHk3Nr3K/lPwCFh
 n55QLyzkCg53eH6KzSqJD1zDPpWQrf8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-Pwuv3udDOomUkjgJU4zRaQ-1; Fri, 24 Dec 2021 00:14:30 -0500
X-MC-Unique: Pwuv3udDOomUkjgJU4zRaQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n3-20020a05600c3b8300b00345c3fc40b0so3801807wms.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 21:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UNxzvN0Qar6P8nUL/xIycC1M4Bs97gE3YexLAe5fv9c=;
 b=iwvNwuW5E5XiFBmNlVaLutPCbe+LO9ph/bm9n0TChRUwh5GUm5Cgpwd1gUAzR/XnOX
 /Fkqqt8xb3NUa81rhdwmhhOPuHzjKn1K/n4BR17w4/djiDKHT7m9A0labFqe1nW689JP
 Pa3WmljV53FW8CITT89vj72dey4XmTvoMSGcF4HixHQagvgVxcmFO8lPWBZjsjDJ+m+V
 pEGIPQdz5N3PGWYUctm0kV1HzCBFwssCbhh/KM+pQkKfG1OEUGu/Vp2Plfi2yd85b0ss
 svz3S2vhee9tXr+Q6PvkHQS//M8hCm8p+9D2S8lhXavzfjhAHpEuUVvgKvj0Aad1PF1A
 GwtA==
X-Gm-Message-State: AOAM532Ih+lRxQk+Zoe2A8vFnMXO6jr8HNODxcCuwEwXQMupJcsjPSOw
 EM4YhWInbYaVtSJTmqr6UoXyxl0J2VaNYmeLUcR1MprrSKQ9Kfe/FoTBax3dmGXe5A4CUcz+q8A
 hsJTKRAz/JQUTZI0=
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr3645426wrq.142.1640322869134; 
 Thu, 23 Dec 2021 21:14:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj6fkgMdmDuqgFPAqQKxZMukurpDfqn3NtIK6xChqLHACgPk/htAOySu9mdbRclErtAVvS2w==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr3645424wrq.142.1640322868974; 
 Thu, 23 Dec 2021 21:14:28 -0800 (PST)
Received: from xz-m1.local ([85.203.46.180])
 by smtp.gmail.com with ESMTPSA id 9sm8629955wrz.90.2021.12.23.21.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 21:14:28 -0800 (PST)
Date: Fri, 24 Dec 2021 13:14:21 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
Message-ID: <YcVXLbqbWpcOdeAK@xz-m1.local>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 07:07:34PM +0800, huangy81@chinatelecom.cn wrote:
> +void qmp_vcpu_dirty_limit(bool enable,
> +                          bool has_cpu_index,
> +                          uint64_t cpu_index,
> +                          bool has_dirty_rate,
> +                          uint64_t dirty_rate,
> +                          Error **errp)
> +{
> +    static bool initialized;

IMHO this is not needed; if we're with a global state pointer then it's the
same to check against that.

The rest looks mostly good (besides the last proposal on API design which you
got confirmation from Markus).

-- 
Peter Xu


