Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A023241116
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 21:40:13 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5DeW-0001g6-5l
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 15:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5Ddn-0001Fo-AA
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:39:27 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42296
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5Ddl-0003gU-OD
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597088364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jtG07dbmEyQq6G8XQiCOnh8h/J+6SQKjFyEd3Y2XRMc=;
 b=XbiTFMQPkg73tgBe2r7ILo4HPIrRONsLrbcNZ0efWLcKe6wp05goOZ0fhPCJLC9G77wGCx
 ZCGDDbD/wewpzWT1gob0cfguED5+T/UXYnsbIATYfeuqusCMCTNDPQLx9BKO6TOgaNhB4B
 qRWgWiD2GgULdeKla03MQVA3z4I2N9k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-3ul7MNgvNBytjmbek28TFQ-1; Mon, 10 Aug 2020 15:39:23 -0400
X-MC-Unique: 3ul7MNgvNBytjmbek28TFQ-1
Received: by mail-wr1-f71.google.com with SMTP id w7so4587352wre.11
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 12:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jtG07dbmEyQq6G8XQiCOnh8h/J+6SQKjFyEd3Y2XRMc=;
 b=o7QspyXYv5KG2rAVRuXXxS9AkiRdt904CPlODUc9Sn2XuNjE5AHnMdit85ZHy/uVU3
 WoTjuHxGiji0UbwVKei+9p245HG/VDyDMuVrLgFJH3yjnKyitwcxzTwfu/gW9dn6SAFV
 A0y8XBD8WIQ6YCbxlHikX+szzIq7IHDgQAkBsB+HNduRg7Lob6jzDhGiJLpYHQZ1vyRZ
 lJfv9Mh/E4Jfpe8yzV1ABww49WRTjDmOL2iwMHnSHbpD9zNwWAqlI6D895qIrTcCWY6G
 jIACoLdzZ3FG+IbAnLd3MxoUOL0RhARCJ2bQgUnefjoIzPMOkGKSPNKqmdgUSJc3b/fL
 +/kw==
X-Gm-Message-State: AOAM530nnAtiYGnS1NKv/eVjrM2a/5tpbvseK4kC4SYuCDHdFUYTkPZj
 U9CSLaVPF8lHFLxG+6wEVopBV2SJbkFqIYp8zDxPAShHsjrkk6F39y3V1bdrtTO/vYOH19emAF0
 +tiHUI0Swl4194s0=
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr778910wmj.128.1597088361861; 
 Mon, 10 Aug 2020 12:39:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya4kCoi02UrkjCLhEIo0zEiyzCzQ47dq5fBkW+QSUcKVFDw9ym/9MtePMt4x8/BCStxk7llA==
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr778892wmj.128.1597088361611; 
 Mon, 10 Aug 2020 12:39:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d6c:f50:4462:5103?
 ([2001:b07:6468:f312:5d6c:f50:4462:5103])
 by smtp.gmail.com with ESMTPSA id f15sm879934wmj.39.2020.08.10.12.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 12:39:21 -0700 (PDT)
Subject: Re: [PATCH 2/2] configure: add support for Control-Flow Integrity
To: Daniele Buono <dbuono@linux.vnet.ibm.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20200702054948.10257-1-dbuono@linux.vnet.ibm.com>
 <20200702054948.10257-3-dbuono@linux.vnet.ibm.com>
 <20200702095252.GF1888119@redhat.com>
 <0ed44c55-1f5d-6866-9555-82134ef628fb@linux.vnet.ibm.com>
 <c81befdd-979c-6060-c0a3-15ea1b142d25@redhat.com>
 <20200702133830.f3mlqli2bxtvk2z4@mozz.bu.edu>
 <f3cf9017-3da5-d6d4-f463-3864ab1f43c6@linux.vnet.ibm.com>
 <b2fc75ef-f6ae-d776-bead-4e6e6de10207@linux.vnet.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5c4add59-86c9-453c-3804-e27fc731ae6c@redhat.com>
Date: Mon, 10 Aug 2020 21:39:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b2fc75ef-f6ae-d776-bead-4e6e6de10207@linux.vnet.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 04:13:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/20 21:01, Daniele Buono wrote:
> So I'm thinking of adding a check in configure. If gold is the linker,
> automatically create (somehow, still working on it) the full link script
> by obtaining the default bfd script and add the required parts. Would
> that work for you?

Maybe even do it unconditionally?

Paolo


