Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC7628D79
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:34:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouilF-0005sI-2e; Mon, 14 Nov 2022 18:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifP-0001o2-Gh
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouZah-0006mi-GN
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 08:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668432814;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5prsnYlog8BaDzkhsDQjsv27f4OIs7jKOI3c2WfklPE=;
 b=d/3fsvmre1PpPH9Hd3soINuAPaeezM3XnWOUpODmt7lrKY1AUjr2+NYDIOcBZdb1uAwc3d
 cRXLF6i+l7rLHT1JtpWg4/Ga4IQRyxqijZZdePCxkUehB63b9igGe1mHZY2zthF5/8p953
 qpq+zdr04CehriIF6cTTuK1X4bApbI4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-303-jQfnXao-MF2Kzu8cZY0MAA-1; Mon, 14 Nov 2022 08:33:33 -0500
X-MC-Unique: jQfnXao-MF2Kzu8cZY0MAA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso1974014wrd.3
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 05:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5prsnYlog8BaDzkhsDQjsv27f4OIs7jKOI3c2WfklPE=;
 b=Eujl10dyfIK6uSnNRjVTnVXVk03uqGbXSsIgHBqivw3DRHBycjFVPDeKzQmg+kG2y7
 klebkzkpl7qw5dC0VntBkWBqTZmWYEVO8PAHdrhfMZzXVjcKm6q3m0wPHgL6jp1r+Hei
 d08S5ag50skDhFA7CO8yqSQqrsiMzu1FZbMamy0PpAuxs4vQL/u+EgTeXAX3egIyRIvx
 qKtmqYnHAHgMzXjecr0ExwKVYgH2uUBMJf3SlTyGXBj4kx3wVbWSV2MBGpcNQinsa+za
 qq5oXRumjLtngyaTxN4tuG41099S6lIOmbro5hpUGLeFOE4uNBwcFI/YAa2Y0VWM99CQ
 VqLg==
X-Gm-Message-State: ANoB5pn+55BFOfoSqAsZlEI7T/rhrOipAb4kXTTP1TAmyQgcyGrkKTR+
 5mwH16zLHEiXl8l/61e/69ZNwyeYtb4xtW8f5y/aG2+OTap8U0LAupSQ1X7Uc6hkpEQiJfHy2a7
 7mRxuR0hbDv01vKQ=
X-Received: by 2002:a7b:c447:0:b0:3a5:f600:502e with SMTP id
 l7-20020a7bc447000000b003a5f600502emr7993125wmi.39.1668432812103; 
 Mon, 14 Nov 2022 05:33:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4THzE2dspoBRZGZZS3mXzO+j+syVs8jQoW7L0Xxr3Zv/245+ppBQK8/Bn2J8Ug+6yrQhqzDg==
X-Received: by 2002:a7b:c447:0:b0:3a5:f600:502e with SMTP id
 l7-20020a7bc447000000b003a5f600502emr7993112wmi.39.1668432811886; 
 Mon, 14 Nov 2022 05:33:31 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 p33-20020a05600c1da100b003c71358a42dsm23420418wms.18.2022.11.14.05.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 05:33:31 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: ling xu <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  Zhou Zhao
 <zhou.zhao@intel.com>,  Jun Jin <jun.i.jin@intel.com>
Subject: Re: [PATCH v6 2/2] Unit test code and benchmark code
In-Reply-To: <20220826095719.2887535-3-ling1.xu@intel.com> (ling xu's message
 of "Fri, 26 Aug 2022 17:57:19 +0800")
References: <20220826095719.2887535-1-ling1.xu@intel.com>
 <20220826095719.2887535-3-ling1.xu@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 14:33:29 +0100
Message-ID: <87cz9p4q52.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ling xu <ling1.xu@intel.com> wrote:
> Unit test code is in test-xbzrle.c, and benchmark code is in xbzrle-bench.c
> for performance benchmarking.
>
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


