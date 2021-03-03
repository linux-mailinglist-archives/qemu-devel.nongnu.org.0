Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A05432BB7C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:23:42 +0100 (CET)
Received: from localhost ([::1]:57952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHYy5-0000xt-Ds
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHYxH-0000Hz-Sf
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHYxF-0003WF-N7
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 16:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614806568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwrq41dTazKUVPFNrSguchjSjBcA2apWKPMn82Y7U0w=;
 b=dJbqGtxuIN9MzJSdti68Kq9fuFtMI/WABRQaxl+QHiNbhb0pyfOnVURu7DtfyfOW9+tupD
 pPQY+k+9vLCX4g4Jr+9TcMN/xtfL9X23+Jtq4f2QJgQHLrbdStIA20jp+XQPHGVSRXC8bQ
 xfiKZL99tBCPjj5NNv/9DjAZO9xBJ00=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-ZdLg0k-BNjegkTCf7G7GQQ-1; Wed, 03 Mar 2021 16:22:46 -0500
X-MC-Unique: ZdLg0k-BNjegkTCf7G7GQQ-1
Received: by mail-wr1-f70.google.com with SMTP id i5so11817971wrp.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 13:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=7DXFiOheQqxP+PpnEhHXXmQ4nfzJ8pWSHtczdztowj0=;
 b=MzcPLXc9dRlF0F+kwhjm4Uv3aEtk7hrz3audg+OqRxF4RwNQDQmNC8VUV+rxiiIZQ1
 R3Y4ohRlnMfABpzO76jkFY8rtLu06H2HsEo7G3aJW5Fkjl1jKM7iA7Uha71UfBvKTHWs
 cXZ0/uoxW/TUQRdHNxm6M5mXYtoYUmKJWrWesvoCqKigs6V+YSAIiCoV8QfpEVl3j4pi
 hcLpp6by9F3yc4D4eYTbQeiTt2CsJpw07LwHtq2xeiWxz9cVfIRbyocrf+vmXWOz9aZ9
 wUhqOz9cc6BDsJl7Pks7Yzs4hazXBGpOxlGoiBSjzaV5ROwZ+gbmq+OIDRGq9HLbF048
 ql8g==
X-Gm-Message-State: AOAM532eoTr9fbmNTUFCQbS9XNmWOO0J/7dUlR3te4xYKJNhWvmfgqeS
 mTGAhD9Mk7OJQLI/sTf0ER9KsElzX6vOCQn5Ck5Y1rpJm/YoMZ/lWcGV51VEsar5DMbp5+8CFMX
 lfAp01kR1phPYWU0=
X-Received: by 2002:a1c:b48a:: with SMTP id d132mr772563wmf.108.1614806565443; 
 Wed, 03 Mar 2021 13:22:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjVANp0Hrn10k5sAWtW/62BdvTI1TeUsyL+dI0CZmF4QYeePtcAcDCwlNBMCjD3A2tc8vs2A==
X-Received: by 2002:a1c:b48a:: with SMTP id d132mr772548wmf.108.1614806565261; 
 Wed, 03 Mar 2021 13:22:45 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6975.dip0.t-ipconnect.de. [91.12.105.117])
 by smtp.gmail.com with ESMTPSA id v9sm33754301wrn.86.2021.03.03.13.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 13:22:45 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
Date: Wed, 3 Mar 2021 22:22:44 +0100
Message-Id: <42016B7B-A144-4319-9F48-92C029083274@redhat.com>
References: <1e13f11b-4c4f-83c6-5c83-8c8accc4f6cc@linaro.org>
In-Reply-To: <1e13f11b-4c4f-83c6-5c83-8c8accc4f6cc@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: iPhone Mail (18D52)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 03.03.2021 um 22:19 schrieb Richard Henderson <richard.henderson@linar=
o.org>:
>=20
> =EF=BB=BFOn 3/3/21 1:11 PM, David Hildenbrand wrote:
>> MMIO on s390x? :)
>=20
> hw/s390x/s390-pci-bus.c, memory_region_init_io*().
>=20

... part of system address space where a CPU could stumble over it?

> r~
>=20


