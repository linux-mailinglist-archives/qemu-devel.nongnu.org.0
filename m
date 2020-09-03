Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59CB25C83B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 19:50:48 +0200 (CEST)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDtNn-0006rR-Ar
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 13:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDtMu-0006S9-VK
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 13:49:52 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37830
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDtMs-0005oE-Dx
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 13:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599155388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CuNGxX52f2NjX+jDi86rMYt4A5qZz4shsPjE4v5wul4=;
 b=Rq5wY0/6n+QhbUbaHNfxNJ4wTT0g5szcSj5zEge8kR+AbnnSWHb6eglqXjy9LoaZTUpxv4
 KB7zuVl0x+HS0ZPNtpwCK8lUC+jBR8a6S6FjzFaM2WYxRuoUDUda5X1Rw9Hs1VJprrlrhF
 bsVE60Jo9ZsvAiNAGqPxtgCIbbBaMpg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-rBRVvDXuMGmxn8TBK75yMQ-1; Thu, 03 Sep 2020 13:49:46 -0400
X-MC-Unique: rBRVvDXuMGmxn8TBK75yMQ-1
Received: by mail-wm1-f69.google.com with SMTP id c72so1203367wme.4
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 10:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CuNGxX52f2NjX+jDi86rMYt4A5qZz4shsPjE4v5wul4=;
 b=D+l+D5rALyH7F7l23Fst9Rk3BEAfSOr11xiw2rTWksSmo/zv1u+Bu7e80VHoQeP0+Y
 GanXB7EKmlBj3ngaUcgXJRTs+0EIu3N2Q4d6tierphKiRgGGaBT5buR+Rw/sOY82ABnG
 hHFEtxm9p0JKsog3fLKlfqiycA7Wx90P5exFKZzAwYKOzZQqAM/c0eZU7kwmVri/vPVi
 AXQYyVLHpNXTIBFoSI+4K91iGvkL/kfSQpGlagLlcrzmCq7B0zMd8gACIUa/Osr2ZDAV
 apNPP09/c8dB33+9AlWN3PjZDK5Mj9z3BpiYFX49RdZJ0X2oHxWvzbd/NRkn8B8GBhZH
 UvJQ==
X-Gm-Message-State: AOAM530PtT9ZzNfa5Oqu2imFljR1C3G/pN/GUgrAApXjMVPf8m6HNwNn
 pC1Nncx+F53ZABorVSo9ZHRAtMehc/NYbBF9GSj9pIhuFUnf2YcSTowu0sT47e8yNgAdzP3d3Ai
 ACQafQrbqi+sxbq0=
X-Received: by 2002:a5d:560d:: with SMTP id l13mr3526824wrv.49.1599155385803; 
 Thu, 03 Sep 2020 10:49:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRRRS+3KvlmOSMn7bxO+pRnI/OdzYFPwg87wBmm6njWqC60qu55JngOrZj8aDPOv0KOeQmNw==
X-Received: by 2002:a5d:560d:: with SMTP id l13mr3526814wrv.49.1599155385620; 
 Thu, 03 Sep 2020 10:49:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:197c:daa0:48d1:20b2?
 ([2001:b07:6468:f312:197c:daa0:48d1:20b2])
 by smtp.gmail.com with ESMTPSA id s11sm5828285wrt.43.2020.09.03.10.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 10:49:44 -0700 (PDT)
Subject: Re: QEMU - Contributing to SCSI Adapter Emulation (BusLogic BT-958
 SCSI adapter)
To: Rohit Shinde <rohit.shinde12194@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, fam@euphon.net,
 Denis.Dmitriev@ispras.ru, Pavel.Dovgaluk@ispras.ru
References: <CA+Ai=tAqoCp5mMD3u7wA-CS+mPjksep8N5zw+q4f3Kf2VGhynw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c0a592bb-076f-6558-5fa1-bb9ebc8e0d8e@redhat.com>
Date: Thu, 3 Sep 2020 19:49:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CA+Ai=tAqoCp5mMD3u7wA-CS+mPjksep8N5zw+q4f3Kf2VGhynw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.403, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/20 17:43, Rohit Shinde wrote:
> I am interested in contributing to the implementation of the BusLogic
> adapter. I saw on the doc pages of QEMU that it is an incomplete
> adaptation and I would like to take it further and complete it.
> 

Hi, the BT-958 is not available at all in QEMU.  What information were
you looking at?

Paolo


