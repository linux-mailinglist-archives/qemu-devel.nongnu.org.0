Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FF06DE1CE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:02:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHM9-000190-E3; Tue, 11 Apr 2023 13:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pmHM6-00018h-AK
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pmHM4-00047t-Lo
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681232427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p4JMCl6e5YdpcB5sVeb7nwHqCZR//bwKhffy9KNVQKs=;
 b=UMgqQv6yAvXbJ8fC8sJ7o+sTryCa9WgDEZk1IOpJCaoNciQlOWcY5HjOdD1vRn3PB3NL+O
 GOLX5g4LA/Vr93oDNBqtE3WcP/JJvhDwabJ/9X/ZgSQOSvlYhud1tebCANKHq+cEs8hFJt
 UEZP8G/hgVgXkq0M3lCkAOjPNd7IzgY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-1LOw3XBwNeig-0Sij1WcVQ-1; Tue, 11 Apr 2023 13:00:22 -0400
X-MC-Unique: 1LOw3XBwNeig-0Sij1WcVQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-74a904f38f3so75433085a.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681232422; x=1683824422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4JMCl6e5YdpcB5sVeb7nwHqCZR//bwKhffy9KNVQKs=;
 b=zVD9yJDaYDRcZM8CTdSeNdaQuRb0rY/pAP5wpj0Ipg4Q9S5tm6/2ALtQ1MKV04D26/
 YqoNZ7tFCYhPLCGqfmfVv+Inp2yXd2JBY4F6LIR03NYCJJSOQC53HnO1I6oG73RmGMtZ
 6x4Ki8e6KhwGfVVyDGDVpolMsbRTq8VYlrt8BVWQt2n0pLhPf70jksUtJ55xqAsv3s+f
 A4NbSafIkkC9MFT1nQ/pXnMjE7iep2rkCTyREnh05+KvpaqI2FJ7yNFtAXoLzQjOVBhf
 Nfb3jEmQSRfDTq1j2dRghSnt4AJq5QxvQ+3fF2LT2qsc5+fFMPUdAy24QBNZ2meQRxGE
 udbA==
X-Gm-Message-State: AAQBX9cn3H3yufkFmBpboDqJPv3w8oXNo1aAI/REHYXzL0yLVmUQzJDJ
 cg1S/bLIHkcClbItCgsJ72xdY9+NAfzSB0rp8+7oDzE1ZAKx981W4N9iejmBdjaW54WOGBVxvWV
 hSyqeW9sHMZvCzPY=
X-Received: by 2002:ad4:5f0c:0:b0:5a5:e941:f33d with SMTP id
 fo12-20020ad45f0c000000b005a5e941f33dmr19389785qvb.3.1681232422001; 
 Tue, 11 Apr 2023 10:00:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zo6/4dRIBM6Bzfc3erQwRoZuK6fLcNl61W6GX85z8eXOllAwRGTu7UKlRzC9U02p2e2yIsSA==
X-Received: by 2002:ad4:5f0c:0:b0:5a5:e941:f33d with SMTP id
 fo12-20020ad45f0c000000b005a5e941f33dmr19389679qvb.3.1681232421382; 
 Tue, 11 Apr 2023 10:00:21 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 d15-20020a37680f000000b0074269db4699sm4091101qkc.46.2023.04.11.10.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:00:20 -0700 (PDT)
Date: Tue, 11 Apr 2023 13:00:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Eiichi Tsukata <eiichi.tsukata@nutanix.com>
Cc: pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, david@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] physmem: use PR_SET_VMA_ANON_NAME to set ram block name
Message-ID: <ZDWSI2RYMbwFqoix@x1n>
References: <20230411041158.66728-1-eiichi.tsukata@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230411041158.66728-1-eiichi.tsukata@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 11, 2023 at 04:11:58AM +0000, Eiichi Tsukata wrote:
> Use linux specific PR_SET_VMA_ANON_NAME (introduced in v5.17) to set ram
> block name in the kernel. This makes each ram block distinguishable and
> can help debugging and inspection. The names of ram blocks are shown in
> /proc/pid/maps like this:
> 
>   7f00e9400000-7f00f1400000 rw-p 00000000 00:00 0      [anon:pc.ram]
>   7f0115200000-7f0115201000 rw-p 00000000 00:00 0      [anon:/rom@etc/acpi/rsdp]
>   7f0115400000-7f0115410000 rw-p 00000000 00:00 0      [anon:/rom@etc/table-loader]
>   7f0115600000-7f0115800000 rw-p 00000000 00:00 0      [anon:/rom@etc/acpi/tables]
>   7f0115a00000-7f0115a40000 rw-p 00000000 00:00 0      [anon:e1000.rom]
>   ...
> 
> Signed-off-by: Eiichi Tsukata <eiichi.tsukata@nutanix.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


