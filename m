Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932872D34E1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:12:17 +0100 (CET)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkHQ-0006F0-Ey
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmj3B-0006I6-9w
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:53:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmj38-0002LE-Ps
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607457205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/EJ3WA21e7Jnd4As/JHPj91wJNsMrOg1V8WHoKts/M=;
 b=Q5OGSuvTpQZMErAySk7AjibIsZIA3+l5bK653ka3EaNJ1cPPgaTXQ7vawtVmrDL5esuvNg
 e7p0Cq+5mX1tce7eYbvcIYFz9oDdxwykrNsf/F4j6pHqbnhFio6/DwKLjS84yCis11UMlL
 7mYPG/b/yi3WqNO62RAk5SeO3Tcwf5c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-vyZd6oL1P3KBYxCrKCRnVw-1; Tue, 08 Dec 2020 14:53:22 -0500
X-MC-Unique: vyZd6oL1P3KBYxCrKCRnVw-1
Received: by mail-wm1-f70.google.com with SMTP id z12so1284996wmf.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z/EJ3WA21e7Jnd4As/JHPj91wJNsMrOg1V8WHoKts/M=;
 b=A4BBsEDUhvhSsvnGnzPIXtoJQyEqvIV8fVzxpwm+T9hSSmajjew8wXaZYNDXhous4+
 mOix8aSt5vNCflYs445TpJKEp86QXgB7aPN7u3k2KAcAqGWnOhprdmAt6Nx6KUOEAiqo
 0HjBC5K2KBd43yJhkDV3r1KE1ra6l5EoltspfMAL+y8xBLvTXcIjylgJFrnuK+IexE+u
 g113yhikWbBHncTRtxAMn4O46rVrN8S3hIEn2Iok88n1msZpqoiq5/+DvPSZXaqn1g1r
 uDaGwhzUS9ils1Lj/coF804CWhmyJTtgZYCVq25tfTB5+ziLeRaQ47PuLMBu6AGnnKfA
 h0Ig==
X-Gm-Message-State: AOAM532gHEonCQEeabKUmT7YIKTZI2Os7wwYaYXsAEqrw1kuufEHfJOD
 9xa2GvqcL3V4GJTkZs3q/neS+i6t5QIBciefn84AEysF2DF4NbyoWlj4x7fibSrrH4CNcTbHku7
 KkRMBKKxOq+2snJk=
X-Received: by 2002:a5d:6845:: with SMTP id o5mr13863758wrw.421.1607457201767; 
 Tue, 08 Dec 2020 11:53:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2xO8EKiz4snjygq2aLKCySDcq+v4cM13zTd1uj8AonEuNpB5+L+jTX1JhBAwm6I3t38URXg==
X-Received: by 2002:a5d:6845:: with SMTP id o5mr13863750wrw.421.1607457201583; 
 Tue, 08 Dec 2020 11:53:21 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id t10sm4331499wrp.39.2020.12.08.11.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 11:53:21 -0800 (PST)
Subject: Re: [PULL 00/66] pc,pci,virtio: fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20201208193307.646726-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8cd05a00-b4ea-1515-43e2-8a56a08e2149@redhat.com>
Date: Tue, 8 Dec 2020 20:53:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 8:33 PM, Michael S. Tsirkin wrote:
> The following changes since commit 553032db17440f8de011390e5a1cfddd13751b0b:
> 
>   Update version for v5.2.0 release (2020-12-08 15:55:19 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 023e57b93a24f2e7901cf460a45cb5058fa23549:
> 
>   hw/virtio-pci Added AER capability. (2020-12-08 13:48:58 -0500)
> 
> ----------------------------------------------------------------
> pc,pci,virtio: fixes, cleanups
> 
> Lots of fixes, cleanups.
> CPU hot-unplug improvements.
> A new AER property for virtio devices, adding a dummy AER capability.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Alex Chen (1):
>       vhost-user-scsi: Fix memleaks in vus_proc_req()
> 
> Andrew (2):
>       hw/virtio-pci Added counter for pcie capabilities offsets.
>       hw/virtio-pci Added AER capability.

Something got wrong with Andrew patches, as the S-o-b tag is:

Andrew Melnychenko <andrew@daynix.com>


