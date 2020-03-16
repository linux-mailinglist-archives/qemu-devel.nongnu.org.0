Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECAE18699B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 11:58:10 +0100 (CET)
Received: from localhost ([::1]:36930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDnRg-0005TI-IQ
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 06:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jDmvU-0003JD-DJ
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 06:24:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jDmvS-0003dL-AA
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 06:24:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60978
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jDmvS-0003Yf-3g
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 06:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584354289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPfOgLH6MLMUFxcwuNkNOlujXUv7XTGrS1wuf6wGQGs=;
 b=ZIYS3nQhPSyK5df8F2yzMNApESOEyU/5MXciqkCNN9lelC4NqMoNkSdFIvXUI+xp6pEWmH
 LXNrkpqX7APn/AfpkT5WDE4GJDns43ctjo/Tv0RTvQwJ+0opb0IzGs9aeAHa2DobuwPLk8
 798qGIcF0ytyO6WGo69B9yaeWunFOL8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-xc2vUWP-N7WZegqPpjRgpA-1; Mon, 16 Mar 2020 06:24:48 -0400
X-MC-Unique: xc2vUWP-N7WZegqPpjRgpA-1
Received: by mail-wm1-f72.google.com with SMTP id z16so530404wmi.2
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 03:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zPfOgLH6MLMUFxcwuNkNOlujXUv7XTGrS1wuf6wGQGs=;
 b=DBemMYu+02MDUb3Dh3CRi8V672iL/yKm1qSAMr2mZfJ/TxxwuUbQm3i5o8wLvv51pE
 E/iFRwAv7PbryFz83e9CPhLebB7M4Eu1DN6q1PcsSl+yN4eEPu76Q9MO08trC4VFHJFt
 ZpQdX6AnfZcWwF+PlR+KgCSdu6gXeM7mrf/GqJJxAk2hmv3FN3KMuGl7Zp06XLIJW42I
 dncPYfZjUi8p4/hZfhhYzRrFaorQgc8TrApkp/bzwaj/dGbTSZ4abIldXOSxZURFHPUz
 Y3Q69whUhG0oSEAssoh4O5HyOYpC8yg1w9Eju0UsCL9qvJyZHeH0Sw3gKS7mpilY7NZ1
 tPEg==
X-Gm-Message-State: ANhLgQ1sAm4gF2CY035wBLDVDwzNYQEXXlVvtU2AappvtWpBstjFsfNK
 Z7TzKcjufqPDnUbPTM1WJH9PM5EdxGPahYhXpGIhEXlNPlBe9j30yB7yNmwPh0knjapSnmbBHby
 E4IvjDbIkoGd36nY=
X-Received: by 2002:adf:90cd:: with SMTP id i71mr34642634wri.63.1584354286638; 
 Mon, 16 Mar 2020 03:24:46 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu6H7yaagdAx18dlx6lgzyKbUZ9B88bB12h2h7umAbmyZaSElILhDLtZ5okaNAA7TuYqq3COw==
X-Received: by 2002:adf:90cd:: with SMTP id i71mr34642616wri.63.1584354286454; 
 Mon, 16 Mar 2020 03:24:46 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.82.39])
 by smtp.gmail.com with ESMTPSA id y69sm30473492wmd.46.2020.03.16.03.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 03:24:45 -0700 (PDT)
Subject: Re: [PATCH 0/2] Fix Cooperlake CPU model
To: "Zhang, Cathy" <cathy.zhang@intel.com>, Xiaoyao Li
 <xiaoyao.li@intel.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191225063018.20038-1-xiaoyao.li@intel.com>
 <93c9cc8c-09ec-d13f-f012-edf86fd945ab@redhat.com>
 <759b848d-8261-5997-2e2b-531246bcdf92@intel.com>
 <a972442e-2d29-674b-7ad6-2f056330ed84@redhat.com>
 <d86b7681-8d99-523b-ebb5-d7d388ef4ca5@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4ef3f6f0-564b-c28e-a783-15af3ba4c927@redhat.com>
Date: Mon, 16 Mar 2020 11:24:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d86b7681-8d99-523b-ebb5-d7d388ef4ca5@intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/20 11:19, Zhang, Cathy wrote:
> Yes, I see they are already in master, but not in v4.2 yet, so will they
> be in the next release v5.0?

Yes, that's what master will become.

Paolo


