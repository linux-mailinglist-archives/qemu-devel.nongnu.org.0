Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE53E6A8B41
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:52:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqpL-00021G-7H; Thu, 02 Mar 2023 16:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pXqpI-00020r-QZ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:51:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pXqpH-0005ir-Ci
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:51:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677793857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pJpVAly2UzTxDNsNT0eE5VfpFY+FJg1GdYZIFNsjMWM=;
 b=ZErFWNuoiMSSB/qYYYZ39KxDtG1j50tUcwSc6hp5Yvkaf2XeWTGOFFlM1RIKYUyFaJjR68
 5BOmyA+S6g2HPqmBQKKRpTgVHjzT2k9ku2m2SetH38ko8KAhatCqqSuS7yhzUHRrQA+zHs
 z+2QT0Ota0zMxFcThG1+2KfMaAJOSTg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-6cFXxaTLPZGN3wecskMiiA-1; Thu, 02 Mar 2023 16:50:53 -0500
X-MC-Unique: 6cFXxaTLPZGN3wecskMiiA-1
Received: by mail-qv1-f71.google.com with SMTP id
 y6-20020ad457c6000000b00535261af1b1so377822qvx.13
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677793853;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJpVAly2UzTxDNsNT0eE5VfpFY+FJg1GdYZIFNsjMWM=;
 b=0EzUTrYpjB97ELj6m36M3cbB07SSSF9JRQ2WMrls2a4KDS+0RmxiwVH8rdsyfpwLEx
 qvZ8fh3VJ1obV5V9tNkjlb9d8AFGe3NE3VGOxjfbaF1OI8H/4Wv1ZT03p2G9E6wR4ImY
 wQX0rqccyVe7kVQ1F62caMEz/ZU2qbcj+J9l34nW7ycdD0Ox9hj/W+0HETB6A2I1aYc5
 s1fn5P3l13m0+/3/XT/d0q/u6XHpZoMePmU53OYL19l+5gbn3U9zQ/F8yur6uwYqciYT
 0WKANs4QB8ZAbWyMvXq9Y6FAC5ZXT3OoNX7+nRHD3AjXRkLlHvrQE+v9w9KXUxDSgZIR
 h18Q==
X-Gm-Message-State: AO0yUKVHoEDP80QiLce+0xsibsJPu1UU7VxZEU21ELk9EfOo7+nCnxl4
 qxzPYBf5o0tuFNXOWXWHMVZxPHCJmjcv6pg8r4rJUlNFA9hWcxZ04DtANwv+Jl26WdhR+4xGUE7
 F5gEP6dZksIf8rxo=
X-Received: by 2002:ac8:5b4e:0:b0:3bf:daef:75de with SMTP id
 n14-20020ac85b4e000000b003bfdaef75demr22270256qtw.4.1677793853279; 
 Thu, 02 Mar 2023 13:50:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9xPuDmluBofmav4tNN8MsV3SuPgx023EIoZQ/QUmLxsuRsOLHppLXFSjEl+YkodVMRd2JnOQ==
X-Received: by 2002:ac8:5b4e:0:b0:3bf:daef:75de with SMTP id
 n14-20020ac85b4e000000b003bfdaef75demr22270234qtw.4.1677793852986; 
 Thu, 02 Mar 2023 13:50:52 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 r3-20020ae9d603000000b007423a4ae27esm482310qkk.12.2023.03.02.13.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:50:52 -0800 (PST)
Date: Thu, 2 Mar 2023 16:50:51 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
Message-ID: <ZAEaO7Yqw2F8hbbV@x1n>
References: <20230225163141.1209368-1-peterx@redhat.com>
 <6c75e2e2-5ba9-bc52-2c6c-a0bfb5f5b56f@redhat.com>
 <ZAC2ccoQpFLa07ZK@x1n>
 <4f130497-1200-8c42-7d48-cadf54f3f6a4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f130497-1200-8c42-7d48-cadf54f3f6a4@redhat.com>
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

On Thu, Mar 02, 2023 at 04:11:56PM +0100, David Hildenbrand wrote:
> I guess the main concern here would be overhead from gabbing/releasing the
> BQL very often, and blocking the BQL while we're eventually in the kernel,
> clearing bitmaps, correct?

More or less yes.  I think it's pretty clear we move on with RCU unless
extremely necessary (which I don't think..), then it's about how to fix the
bug so rcu safety guaranteed.

-- 
Peter Xu


