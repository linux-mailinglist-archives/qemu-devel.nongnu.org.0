Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035E723EE7D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 15:56:35 +0200 (CEST)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k42rJ-00087j-EH
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 09:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k42q6-0007HG-5P
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 09:55:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58539
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k42q3-00013E-SU
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 09:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596808514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXr8603nuMotMPX7wMWi9xyLtssQIyC2LNR/pvGLNFo=;
 b=YsyM2lC4MmcYpJGaBKUBGM6aqsxr5sjzRxqCmpzQBvxMbsBtkboF/G7qmesJ2XcKu3oB77
 XcGSCTOXv439mLdYVu5hG/agPibB1CRIg7jCsXHExL54KCIUN8O2ywfrg/5JSMZoFAnjpP
 IgoIFoFnOpD4o6hISydOTEFs8nT5tLE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-SXw8xHNvPBio9QDIB792MA-1; Fri, 07 Aug 2020 09:55:12 -0400
X-MC-Unique: SXw8xHNvPBio9QDIB792MA-1
Received: by mail-wm1-f72.google.com with SMTP id d22so837483wmd.2
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 06:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pXr8603nuMotMPX7wMWi9xyLtssQIyC2LNR/pvGLNFo=;
 b=OyHgrIOEbDHgp8+bnTpXaMzVJWbWMySbcZl5LQezXi8yM4omCRwzMtfO++dR0DXNVy
 IaFwwEW2ZCOa4sMCNMQarDL7OOjUpz8w63JuVVLAjr+PfaUGHG8LPokOdrQ/jslVRW8K
 lxHHAZTOgyhRmp4Kt4rxph5hIrCM+8PZJgr0oATXfMxMMg1otldKcbp0LiqbmCfetelK
 eybr1n/58X/7V8xEasn0YH3B6j/R+T2POLl/958ChMIYjrj44IlzzYgdORe9ztIiJIRm
 Iov0GL+6dFb8Y3ZdT70ia3Y9glUNqoT6K8Mh/vyGsyx/DJQj9pQTV4L0btxXEqoYb3tv
 3gqQ==
X-Gm-Message-State: AOAM530rHLb8KB8IPJ4IZCxZEebscPK0qR0/gJNeFW/MCKFI+YwErLBX
 GIJLnAcdpzyH52cMeT7yHWerANR8+WCyKLqZjcDvcg1uiOI2CrR8TkZxJVdHijDgqMg2KpuJdkI
 iPHw+XGainUraCak=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr13571382wmi.183.1596808511784; 
 Fri, 07 Aug 2020 06:55:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZppaESbDJzKmczlWyYJd2gAVMzze3MyZHzs3JolrVFX2WJ5f/LYM3uJ5kG4oZUrqMRWxAGA==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr13571364wmi.183.1596808511577; 
 Fri, 07 Aug 2020 06:55:11 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.136.3])
 by smtp.gmail.com with ESMTPSA id p14sm11208277wrg.96.2020.08.07.06.55.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 06:55:10 -0700 (PDT)
Subject: Re: [PATCH 003/143] pc-bios/s390-ccw: simplify Makefile
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
 <1596741379-12902-4-git-send-email-pbonzini@redhat.com>
 <dc047d21-128d-74b8-5710-a7d6d969a9be@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a354d49d-151e-989d-909b-f53c553b43fd@redhat.com>
Date: Fri, 7 Aug 2020 15:55:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <dc047d21-128d-74b8-5710-a7d6d969a9be@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 04:00:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/20 14:58, Thomas Huth wrote:
> As Cornelia already mentioned in another mail, this does not work yet.
> I'd also prefer if we could keep the netbook.mak stuff in that separate
> file.

It won't be possible to keep it separate when it's converted to Meson
(unless you add a new directory for netboot), but for now I'll surely go
for the bare minimum patch.  Thanks very much!

Paolo


