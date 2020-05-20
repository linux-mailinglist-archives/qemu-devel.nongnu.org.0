Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94991DAAE1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 08:44:06 +0200 (CEST)
Received: from localhost ([::1]:36590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbIST-0006Yl-Me
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 02:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbIRm-00069t-UV
 for qemu-devel@nongnu.org; Wed, 20 May 2020 02:43:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49988
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbIRl-0000L4-Gt
 for qemu-devel@nongnu.org; Wed, 20 May 2020 02:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589956999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZu4nDrIdbLaWalYeGJWP2bm7sD2cNxp0d6hUTkcXcg=;
 b=AFb/vdpQSYk1E4JhRCy9mWVNfMlr6+0aypfREwzP1eraajtl+8g9QGbvfVcjHhVRPXQUsI
 7fVk5FM34iFp9+6u23nX6IwgCGt07PoKNNOxIDfGoiziyrLJu/rRI6kAx7kRXg19iGBJhQ
 DF4CV9o4UrCPZvOYnFwMQN2o/Yh0r1k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-pzW2AS1vPEuWH-_C03Tiew-1; Wed, 20 May 2020 02:43:17 -0400
X-MC-Unique: pzW2AS1vPEuWH-_C03Tiew-1
Received: by mail-wm1-f72.google.com with SMTP id n66so805674wme.4
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 23:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tZu4nDrIdbLaWalYeGJWP2bm7sD2cNxp0d6hUTkcXcg=;
 b=natfbDf3XqEFL1Ed+Fa1UPQJMbW70ITY3OhJ+YsIn6XhmYOxxOokmWETA8sM00/6kq
 BcMCBnZtjCYMs5vLSd+VnEU6YO1JqnPAGfz1/ZOzBvownilyTANcynUuzdwmy0HynKBM
 bvi5dGLtDktmCIjYCVplJ0VY9JxrZrpRdpPs46Bt2hN9DmajNBthBPFW84fDery3LRxl
 1Y7hCu6whzYKFyfVs5nvjOJNW4+GtCe5j6kZHCcnBbhAEnYC5uM5cTNmjFOlNZy6l5Cb
 pT1mXQHEdaQrI6NjyNgdoxxD/fcm1yVlEH5lwDpF8SmbM9095rYNvgfW0cdVkzw38ntJ
 /Ipw==
X-Gm-Message-State: AOAM532TfVv0wcPVxxLCg6DpZG0b08Oswrizimc3UCDca3W9VUQs+H99
 74H+CveAPRD29kdiHvqPjKZ5+pMe1sf247sp3C5cxeA6OrkQFPdRsA5u0Itv+oxWw2nfRIuB+lp
 C3MKcRBdHlD8nbAs=
X-Received: by 2002:a1c:b0c8:: with SMTP id z191mr3254165wme.165.1589956996066; 
 Tue, 19 May 2020 23:43:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN5swxIDLIuIO2VS/gvdAB1kDvXDP1gpYFbx8peUMCFJg/LCKkOD6lcWu2bgTFVmsmVtGsBg==
X-Received: by 2002:a1c:b0c8:: with SMTP id z191mr3254146wme.165.1589956995821; 
 Tue, 19 May 2020 23:43:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:591e:368f:1f3f:27d2?
 ([2001:b07:6468:f312:591e:368f:1f3f:27d2])
 by smtp.gmail.com with ESMTPSA id z11sm1794731wro.48.2020.05.19.23.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 23:43:15 -0700 (PDT)
Subject: Re: [PATCH 51/55] qdev: Make qdev_realize() support bus-less devices
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200519145551.22836-1-armbru@redhat.com>
 <20200519145551.22836-52-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b0188311-e138-cf55-c0e9-52313b5aa906@redhat.com>
Date: Wed, 20 May 2020 08:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200519145551.22836-52-armbru@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/20 16:55, Markus Armbruster wrote:
> So far, qdev_realize() supports only devices that plug into a bus:
> argument @bus cannot be null.  Extend it to support bus-less devices,
> too.
> 
> qdev_realize_and_unref() remains restricted, because its reference
> counting would become rather confusing for bus-less devices.

I think it would be fine, you would just rely on the reference held by
the QOM parent (via the child property).

Paolo


