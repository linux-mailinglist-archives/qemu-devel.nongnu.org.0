Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A44B87C6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 13:34:48 +0100 (CET)
Received: from localhost ([::1]:35342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKJWB-0003tA-0o
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 07:34:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKJT6-0002Wb-0r
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:31:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKJT1-0008Dt-F5
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645014688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qf+qLIBo9IqRy6DMwrNftaqAuMqnEGKPpTc8FbnIS5w=;
 b=AJQTbREeizTLd6eRerKpiU7lp1eqqQPQADXLJWV8ST4C0HQCsbuUaOWG6itfTiKdHMZ7C0
 uNxWmsbomhNHswewGebJIIGEaZgq+lmwqq9l64FsMYXivB/5oP18/G8AKjyoodMEwn3Lub
 d9MHPK+qkCzjU2XqjmLDI4gixC+xen4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-pTZn0KFLOpisk1yktNb8QA-1; Wed, 16 Feb 2022 07:31:27 -0500
X-MC-Unique: pTZn0KFLOpisk1yktNb8QA-1
Received: by mail-wr1-f69.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so1037726wrc.5
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 04:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=Qf+qLIBo9IqRy6DMwrNftaqAuMqnEGKPpTc8FbnIS5w=;
 b=qG/8qkYmqzWQs9i8MN6H4rZqu9OwH3FP4dsZM3ARydnYeBJcDb9dWIgJTDRK8yd7dw
 yHDSh3t4KaPDfo21OdnlnNO1ia+IuocgJvk90CtloVzLyvQR4GaU/8sUZMHaWNO78GTu
 +ETwEY1lDYdNCUWk5tkiPub2LKRuI9dwGSRcVlcddGSO4BvmPlPJ9GkiUh7bAQ/Iq/gI
 1YhiHUnSYYo4DE6L91DwkCbkg2Usx7WRW5hNKu9UMOm6m1bPuNVTfz09s6jJfM/vJVI8
 e7mMyeso78BncU1lDg+h6MtQy+6Dwk1jfbvjasI7IPUrXLDma9V+ypBeYt1XaudYR/M3
 zpiQ==
X-Gm-Message-State: AOAM53132dIHeynknnOI263e7IWPE4UqmeyEtKRosqOXvSkTbBwhlMjj
 6m2kYqp8d466EbRFHnOMLvO4ze6dNJWwXJY3d6I4xB0ZrYuoTgUc5jtb1zu2h2dQ41+JDjhFdTM
 yW8HLng908CNAQ8Y=
X-Received: by 2002:adf:f0c6:0:b0:1e7:13f7:74b9 with SMTP id
 x6-20020adff0c6000000b001e713f774b9mr2144885wro.361.1645014686036; 
 Wed, 16 Feb 2022 04:31:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKYP4zazQRjl42UAfgk4WiJ+S+NTuLHk+tvyu6ep3OvSkUE8kjB0Yw9q0pqKJjftnX+3aUEw==
X-Received: by 2002:adf:f0c6:0:b0:1e7:13f7:74b9 with SMTP id
 x6-20020adff0c6000000b001e713f774b9mr2144871wro.361.1645014685842; 
 Wed, 16 Feb 2022 04:31:25 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id u3sm21839018wmm.0.2022.02.16.04.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 04:31:25 -0800 (PST)
Message-ID: <c13291ec-ed73-a62d-24bc-e4282aad2031@redhat.com>
Date: Wed, 16 Feb 2022 13:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: Richard Zak <richard.j.zak@gmail.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 QEMU Developers <qemu-devel@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: QEMU's Haiku CI image
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi,

while researching the different "sed" options on our supported build 
platform today, I started "make vm-build-haiku.x86_64" in my QEMU build 
directory for the first time since many months again. And I had to discover 
that this is completely out of date. The image does not contain any version 
of Python 3 yet which we require for compilation since more than a year now 
already, and the Haiku version in there seems to be too old to do a "pkgman 
install -y python3" ... so this has been completely been bitrotting since 
more than a year now. Is anybody still interested in keeping the Haiku 
support in QEMU? If so, please help to get the VM image updated. Thanks!

  Thomas



