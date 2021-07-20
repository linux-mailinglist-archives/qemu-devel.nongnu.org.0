Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263D13CF932
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:52:20 +0200 (CEST)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oIN-0000Bs-6B
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5o8Y-0007Vq-KZ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5o8X-0000OO-0L
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626781327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/R4PQNRKpCCBTHJ+917NRYB9uLB3eBEpEQO57rI12uA=;
 b=SdmZQRpVWRCLgw2J9UnSHj2Np/W28n5zPKECnNneCv9HpSeymz5u2RkQE6ARiytsDU6xZP
 m6G50oEHDcFZHnIWe0YPEBZElSgbFURHKJEKc0JayvDsnpV6gwhZdZbb+UxdBWVZXuOzvv
 +HrzWlPB+z1j4EO3bs5L2mgX9WUmUzo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-eAGjEbk5PeOH1fWliEliFg-1; Tue, 20 Jul 2021 07:42:05 -0400
X-MC-Unique: eAGjEbk5PeOH1fWliEliFg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r18-20020adff1120000b029013e2b4ee624so10264917wro.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/R4PQNRKpCCBTHJ+917NRYB9uLB3eBEpEQO57rI12uA=;
 b=XOw4/wr7FCV9Zdxu2PYAwQS0jHkCipx1eeGbaUVtxIX01zUHc+5qqcpOqQcKtbD+bu
 iJhQMS0nuoH9H8Mq7TwlGRytaRfyj1Baejzzg7nnnx2MyFcjxVS1uW8g1tSmcWA6J78A
 TeYS6zqosrShd6qA9BabpMFYhcqRhYpOuZlMFrCAd5PvIhqpSm3lGoRvLvmL/9VID0nW
 2WmsMfIG0I3jbePSoRNJ6ndmSMV8oZ23cEUXn1wry8lMyU8HlMw3UGv1sMUgC0J5QKme
 9PCTQ/TDAtaYt20OZWjzFy3YApI5oOynec62BA94Q1MLGGyqIoWaAHnpHIiVEp55ygcJ
 jn4Q==
X-Gm-Message-State: AOAM533jzU7Vwb6MQ08cm/sMzVo5o5sWpK2nOp1Sra4Jc3xUWnITumdy
 /Dn6Vmq1ObV1K2FRtohzu8ffCyA9hSG83Rf4DPNzno/yDS/t32EBgjfhP13ApGYnI1MZZOhXYUV
 3cSUgRQqboJ2+SSM=
X-Received: by 2002:a5d:408d:: with SMTP id o13mr36101481wrp.246.1626781324461; 
 Tue, 20 Jul 2021 04:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxciH3+js7LWws2rX7iQjivEllakAwVgaOpM615M3yx62MAFRu6NQONzQN+QnpRwl0msIcpKg==
X-Received: by 2002:a5d:408d:: with SMTP id o13mr36101468wrp.246.1626781324345; 
 Tue, 20 Jul 2021 04:42:04 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id b15sm10543766wru.97.2021.07.20.04.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 04:42:04 -0700 (PDT)
Subject: Re: [RFC] Rust vhost-user-scsi implementation
To: Gaelan Steele <gbs@canishe.com>, qemu-devel@nongnu.org
References: <B2112AF6-3E5E-4CF6-8714-C2DE109FD7E6@canishe.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d486fa07-105b-66d4-3329-c58bed56ff9e@redhat.com>
Date: Tue, 20 Jul 2021 13:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <B2112AF6-3E5E-4CF6-8714-C2DE109FD7E6@canishe.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:55 AM, Gaelan Steele wrote:
> Hi all,
> 
> I've been working as one of QEMU's Google Summer of Code interns to
> implement a vhost-user-scsi daemon in Rust. That work's now reached a
> point where it's usable to attach read-only raw disk images to a VM,
> and I'd like to get some feedback from the QEMU community, especially
> anyone with experience with the SCSI protocol.
> 
> My code, and some further information, are available at
> https://github.com/rust-vmm/vhost-device/pull/4 or
> https://github.com/Gaelan/vhost-device.git#scsi-v1.

The previous link didn't work for me, I found your work here:
https://github.com/Gaelan/vhost-device/tree/scsi-v1/src/scsi

> Feedback is
> welcome either on GitHub or by email. If people here would prefer me
> to send the code as a patch to this list, I could do that as well.
> 
> Thanks!
> Gaelan Steele
> 


