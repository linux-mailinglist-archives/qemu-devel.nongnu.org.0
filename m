Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F886DD66C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 11:17:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmA7l-0000vb-H5; Tue, 11 Apr 2023 05:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pmA7h-0000vD-9a
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:17:10 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pmA7d-0007zB-2Z
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:17:08 -0400
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B81252009F;
 Tue, 11 Apr 2023 17:16:53 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1681204614;
 bh=E7HdgEKc5JZpjXIG5blv5WdmBQ08WeQODtxyA5LGZ8k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=cgTXHdPRHJNuuZJDJMLiQw/7tNRgQh0D0iNF23sqCFANkuh9tiz/IyudnnEMeyONv
 0lDuEkItKBnf4qngQhHqGaDbXP7hfqfdyx/qwZ8TckrqWMoe/CUq+rHOWqMOstbsto
 qJDHwj+GqmUwNiJTFBHq4pOj78RtWVA8ocFVfxUr1bHscPY/G9SdilQYfDkAWvF6hg
 oeTsDWVkZHVLdzTB7dDxUoK0VBkkCgXDJCJ2PoOBvZsGqhlMOtAUhxdfwx/+25q6XD
 O5RwpA7GMw2Hv6AftW2jCaqPIcBWJ9E+BTM0X/mxN7oE2lowASQoEYjSEIjCaaAvIW
 jbHQE+CaOJfLQ==
Message-ID: <4f19c8280191fe2ed1f8f7c25288e93de014b45c.camel@codeconstruct.com.au>
Subject: Re: [PATCH 10/16] hw/i3c/aspeed_i3c: Add IBI handling
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joe Komlodi <komlodi@google.com>, qemu-devel@nongnu.org
Cc: venture@google.com, peter.maydell@linaro.org
Date: Tue, 11 Apr 2023 17:16:53 +0800
In-Reply-To: <20230331010131.1412571-11-komlodi@google.com>
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230331010131.1412571-11-komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=jk@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

SGkgSm9lLAoKPiArc3RhdGljIGludCBhc3BlZWRfaTNjX2RldmljZV9pYmlfZmluaXNoKEkzQ0J1
cyAqYnVzKQo+ICt7Cj4gK8KgwqDCoCBBc3BlZWRJM0NEZXZpY2UgKnMgPSBBU1BFRURfSTNDX0RF
VklDRShidXMtPnFidXMucGFyZW50KTsKPiArwqDCoMKgIGJvb2wgbmFja19hbmRfZGlzYWJsZV9o
aiA9IEFSUkFZX0ZJRUxEX0VYMzIocy0+cmVncywgREVWSUNFX0NUUkwsCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSE9UX0pPSU5fQUNLX05BQ0tfQ1RSTCk7Cj4gK8Kg
wqDCoCBpZiAobmFja19hbmRfZGlzYWJsZV9oaiB8fCBzLT5pYmlfZGF0YS5zZW5kX2RpcmVjdF9k
aXNlYykgewo+ICvCoMKgwqDCoMKgwqDCoCBhc3BlZWRfaTNjX2RldmljZV9zZW5kX2Rpc2VjKHMp
Owo+ICvCoMKgwqAgfQoKU2hvdWxkbid0IHRoaXMgYmUgY29uZGl0aW9uYWwgb24gdGhlIGliaSBi
ZWluZyBhIEhKIHJlcXVlc3Q/IFdpdGggdGhpcywKSSdtIHNlZWluZyB0aGUgRElTRUMgaGFwcGVu
IG9uICphbGwqIElCSXMuCgpDaGVlcnMsCgoKSmVyZW15Cgo=


