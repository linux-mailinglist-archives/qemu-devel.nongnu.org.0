Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E427160A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 18:47:39 +0200 (CEST)
Received: from localhost ([::1]:58880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kK2V0-00052L-8D
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 12:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kK2SB-000462-IW
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 12:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kK2S3-0002Hw-UB
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 12:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600620274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=loz4vzgQwUjLwy7YfZI9IK7D47Pel9Fix1i+takbN7k=;
 b=UEUNhJbyLaHnsGaIFOD4TUNszfgafXkeGshSELaYXfZhaF/KSGAUKi48maB1FFr2PlH3V5
 U0CWM3Y8GpZuB6S83l2aJBV9s027SrBEaYGJDo128yC6qkcSl/7I59NhqC0aKCV3EtPvzB
 7AiGejKZ4KhErvWF2kl4ZDFD3FkndEU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-llyhqACZPmGKs-qhI3Opyw-1; Sun, 20 Sep 2020 12:44:32 -0400
X-MC-Unique: llyhqACZPmGKs-qhI3Opyw-1
Received: by mail-wr1-f69.google.com with SMTP id j7so4767535wro.14
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 09:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=loz4vzgQwUjLwy7YfZI9IK7D47Pel9Fix1i+takbN7k=;
 b=TcTnW10cnqayHM4JMWLpsdCberXV8dt+PCLQB2cwxPPHNZ7aiIqGudv19fcEnXcrNg
 55mC7GeqNocaZ7d4X9vk93ozts7zPRlMoRKSa0mjahyDbz/QFdHqWPjLUVvBtTQ5IEbm
 LBSPVXJ22uftiZ0pLcGviNzU5MMO8sT7+hPfvbccOHzqPfsTIuGqqeGpKF4T+hqTZ+eM
 nomsoDNzqkUIhacSO8Gc5fu5xAcMqv3qWUjk0Rhol5spCeK8NzO/qvroN+5hh5YA7ilg
 rgIW6lFsUTXMZOxt9vMV+Xg1U40gjCYkj6nLEsnZQkL8Oy98NGyAQS6WyIJGcDey1hjK
 3POA==
X-Gm-Message-State: AOAM531PwQIe903CnWkFbz6ZZyivxQD6HbOQ/PMmkNvQFhpj3S3Jt74o
 WGFcZ61FL302aUmGwUUf1aEX69U5/UFivcKlPmSo44GDlzvH5Hl4QjV0cxLESEQcK6xJ2Ancz1+
 nuz18qfDOwDDm0c8=
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr52684244wrs.153.1600620271492; 
 Sun, 20 Sep 2020 09:44:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz1eqPoJn1q7A5sOExbXmON5lb3Lm32EEDZ86QLJ3HpBPn6882guEqh6hFq1jKT2GP/7ofJA==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr52684232wrs.153.1600620271315; 
 Sun, 20 Sep 2020 09:44:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d107:d3ba:83ae:307e?
 ([2001:b07:6468:f312:d107:d3ba:83ae:307e])
 by smtp.gmail.com with ESMTPSA id d2sm16069830wro.34.2020.09.20.09.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 09:44:30 -0700 (PDT)
Subject: Re: [PATCH 7/9] configure: remove target configuration
To: luoyonggang@gmail.com
References: <20200920130708.1156310-1-pbonzini@redhat.com>
 <20200920130708.1156310-8-pbonzini@redhat.com>
 <CAE2XoE8=igq7emJNFkPJ61TdnU1eigT6GFJPb5WHywtKQzZWSQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b79e82d9-b2e6-8fb0-1da1-98c0ec90658d@redhat.com>
Date: Sun, 20 Sep 2020 18:44:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE8=igq7emJNFkPJ61TdnU1eigT6GFJPb5WHywtKQzZWSQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/20 11:14:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/09/20 15:13, 罗勇刚(Yonggang Luo) wrote:
> Can these be generated from meson directly?
> as makefile finally need to be removed

The files aren't generated and are independent of the Makefile
infrastructure.  Don't think too much of the .mak extension. :)

Paolo


