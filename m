Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E5B453A82
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 21:03:10 +0100 (CET)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn4fc-0003Ct-Uq
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 15:03:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mn4dj-0001At-6M
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 15:01:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mn4de-0007rB-Ru
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 15:01:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637092865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KmDIZY38Wne+cI8jjn5p0ogJSwLYOahiUpt1W2oa94o=;
 b=gi4wR6BylL2rf491j1vL7//I+QrNPXcIEr16KRD9sYwQ7msMpSXkh8tNk2iVoQE5gfzJiU
 CZgyMYg9IwUUN9j1HljekC99KCUlL4vkijwsq5ORFq3wGwDBwMBZ4ThW31+njN2kUMwDRk
 eUed0iOuNBPCllaFBEo0WiheeAd4rOI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-upMbYVbNMmqHnO05fHzKJA-1; Tue, 16 Nov 2021 15:01:04 -0500
X-MC-Unique: upMbYVbNMmqHnO05fHzKJA-1
Received: by mail-ed1-f69.google.com with SMTP id
 w18-20020a056402071200b003e61cbafdb4so29573edx.4
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 12:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmDIZY38Wne+cI8jjn5p0ogJSwLYOahiUpt1W2oa94o=;
 b=S2Pst+R+G8UpdU4mnJuOl6O2xGztsAy816K2dUD/3utoriVqKmpETGzzDUmNK2kZXF
 KYLS9Oz6q3S9ADWYQ+DrRo78aWw1e23GmcglSTYYXJoRtzwYoNNtp/8HLE0OIFLYG8dx
 joxt5awtafSMuYBvClEySrr99XxAy7VoKw6Nwtx1Oqc+qgt5ikdkwFtfpqznGRSicCKn
 YaoN3xfv+1pLjH+1t+sTFYBht1w7a/Va/YytVhhW7Sp8B1XBeqvtit6VqD0S5ehWupSB
 c88wjRrGWlaNnaqIjbzEL38lRhL8tF9fWe0bhRgAgno7B3z2W4LRyHXF6mZtKaw42qir
 EElA==
X-Gm-Message-State: AOAM533CqT1Re+u3RU1NsA1zc2EGqv1bPHxvO6o0byRw8O6OUj+GTTD9
 ZzRLurNHLAW0x1P1UmCc8hW0X0I7IMLs7dfyJX2xiOTA8oLdfqr4wFaMQyB438QOrLuZ+qscXT6
 bQ5rzWedHcimPEBo=
X-Received: by 2002:a05:6402:1450:: with SMTP id
 d16mr409034edx.144.1637092862902; 
 Tue, 16 Nov 2021 12:01:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw71jM3raVpvZB4g3+S6jaVAsBvllDzhfOJ+GYpBLOOju13oRSAkR0QO8Cgp7zvMzvOYnDiNg==
X-Received: by 2002:a05:6402:1450:: with SMTP id
 d16mr409006edx.144.1637092862694; 
 Tue, 16 Nov 2021 12:01:02 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id j15sm9870889edl.34.2021.11.16.12.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 12:01:01 -0800 (PST)
Date: Tue, 16 Nov 2021 21:01:00 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: lma <lma@suse.de>
Subject: Re: Issue with acpi hotplug on pcie root ports in case of q35 +
 ovmf + machine type 6.1
Message-ID: <20211116210100.3f279b3d@redhat.com>
In-Reply-To: <e7f2739ce7bb393aa8f5c550b0c5f418@suse.de>
References: <e7f2739ce7bb393aa8f5c550b0c5f418@suse.de>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 02 Nov 2021 16:03:11 +0800
lma <lma@suse.de> wrote:

> Hi list,
> 
> Have you experienced any acpi hotplugging issue while using q35 + ovmf + 
> machine type 6.1?
> According to the error message in guest kernel,  It seems qemu with ovmf 
> doesn't prepare
> enough resource in PCI space for acpi hotplugging on multifunction 
> bridges.
> 
> Please refer to issue#705 for details:
> https://gitlab.com/qemu-project/qemu/-/issues/705
> 
> Thanks,
> Lin
> 

it should be fixed in current master with the latest machine type (6.2).


