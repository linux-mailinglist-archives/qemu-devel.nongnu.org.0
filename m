Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400226034FB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 23:30:28 +0200 (CEST)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okuAN-0002yP-BP
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 17:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viacheslav.dubeyko@bytedance.com>)
 id 1oku6q-0006Ci-3Z
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 17:26:48 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:35396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viacheslav.dubeyko@bytedance.com>)
 id 1oku6n-0007O0-Iu
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 17:26:47 -0400
Received: by mail-qk1-x735.google.com with SMTP id t25so9563851qkm.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 14:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1APKT53JG/wq6o2jf11XrZ2this9jjAZ26YhgTsfr3Q=;
 b=EJT5iaQECqnQH+RhOPioS0o9T6t4WM/Hn0BTupAHOI0GE+mpGwwAOZxUqRuNP43EVI
 IfiaqPO2PXtbzj3omXIr9Mgl9rUPKndG22RG9+YislkQ8CzQHHhGcEE+50/aVc04SI4V
 63FCiMiDgYTNN4qA0cPHNNXPYCJx6T72DhmWWs+FlWeq7gTKJOO85BqI2oyVtPZMhv9E
 OivLHODRXfHD3xQC/NlWvq1T7Vrw23Bt+pJHAjVAQrA97HgBwu9KWbV5vy7Np+NOCkcm
 c+Y1CT/Zth5nqwjJg+SPQTrDKCQpVUisGAfmJ/J6SYj40zuvsw1XyQdE/QRQbyqaHxqZ
 nXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1APKT53JG/wq6o2jf11XrZ2this9jjAZ26YhgTsfr3Q=;
 b=drKUDJysBhosfhQb6LDWPbyGrCj1jFMbwBpqhBH95np1PMlFGDV++WuLY98c/GRVPA
 5EA+qwonieP7wTUuHXUqj6OcadeeSt6BhL7rV0l/DIU+HjNivdn4OsZgItDh3YEUCxC0
 DdGbhM+Zc0pztxvZ9yqir565wd2DUWMsMDvcDG+IsddTVQglJOd0lWTyE4eOcMk0E3aa
 DH92I2bOmL/aNDtNy9syVwanFBO5TsLri27QT3I7L7+ProKNH5f5+AgjttdZ9GjZ1nEB
 G+q8ZoJ4Odt7UmU+caApinNE3lFiRq0LhI3oCtoYlxrw4Q6g+fjog+D96gDgRjGKuz5h
 QJRg==
X-Gm-Message-State: ACrzQf0FyqaJ1MfaE8addI/e+VYt06ZjnQGYZhu+iOyWn14vZy4VZSCa
 payflhNfiCiiYF2MUqPLVSUcng==
X-Google-Smtp-Source: AMsMyM5zfVX7YK8H4zeLd4F13pSOxunbIXNTbw/a8/Opu24z/18MiYx7QGM781YEO+aBz3RKXKlIdw==
X-Received: by 2002:a37:c13:0:b0:6ee:6ab3:8b9 with SMTP id
 19-20020a370c13000000b006ee6ab308b9mr3291384qkm.664.1666128403760; 
 Tue, 18 Oct 2022 14:26:43 -0700 (PDT)
Received: from smtpclient.apple
 (172-125-78-211.lightspeed.sntcca.sbcglobal.net. [172.125.78.211])
 by smtp.gmail.com with ESMTPSA id
 cq10-20020a05622a424a00b0035cf0f50d7csm2657342qtb.52.2022.10.18.14.26.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Oct 2022 14:26:43 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [External] CXL emulation in QEMU contribution
From: "Viacheslav A.Dubeyko" <viacheslav.dubeyko@bytedance.com>
In-Reply-To: <20221013160902.00001c32@huawei.com>
Date: Tue, 18 Oct 2022 14:26:41 -0700
Cc: Adam Manzanares <a.manzanares@samsung.com>,
 Cong Wang <cong.wang@bytedance.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2DECB41B-DB90-47DF-BA8E-BEE6869BADFD@bytedance.com>
References: <20221011095228.00001546@huawei.com>
 <31569DD4-6502-4188-8962-08E0A15B08FF@bytedance.com>
 <20221013160902.00001c32@huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=viacheslav.dubeyko@bytedance.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jonathan,

> On Oct 13, 2022, at 8:09 AM, Jonathan Cameron =
<Jonathan.Cameron@huawei.com> wrote:
>=20

<skipped>

>> So, I would like to contribute to QEMU emulation of CXL memory
>> support. And I would like to see a TODO list. I hope this list could
>> be useful not only for me. As far as I can see, we can summarize:
>=20
> Absolutely agree on need for a TODO now there are multiple groups =
involved

As far as I can see, Fabric Management looks like =E2=80=9Cuncharted =
territory=E2=80=9D with a lot of work. I think it=E2=80=99s pretty =
interesting direction for me to start. I can read Compute Express Link =
Specification (Revision 3.0, Version 1.0). Could you recommend some =
other docs or links to take a look?

By the way, I see ARM64 support in TODO list. But nothing related to =
RISC-V. Do we need to consider RISC-V too?

Thanks,
Slava.




