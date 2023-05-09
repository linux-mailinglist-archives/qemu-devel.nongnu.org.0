Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798AD6FCA7A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:46:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPXA-0006MB-HE; Tue, 09 May 2023 11:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <juan.quintela@gmail.com>)
 id 1pwOQo-0000xy-Qw
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:35:10 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <juan.quintela@gmail.com>)
 id 1pwOQm-0007IG-Eq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:35:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f37a36b713so60097335e9.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683642907; x=1686234907;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q1YdxCB85DjavEkSSztecs/1uZiFEj5gdNIdoSOu2jU=;
 b=JjwcIBMfH+BKJVT6FcDztOmongSI6w+OBJ3K9dqquNYFHFhfY1nBfCuSiaQvTio+3q
 wPer1OGk4WFag7yRr2sj4GG65I2c5wIpn4I7aRYIzWj/EHyEDaIf0JOGLNMYI7akj0q0
 r4JRt7SZUYifZc8eNv8nzcGzuwNFB8emQ3EzaTBg5IzyWjMKUUv3lskT6TwhaU9i3oX/
 nb5NfU4EOSHOEoLNn/VrzvMT2SCtToGbf1BihltZYcPw4li7nhDS9qPJN6UvVBQNkD/V
 yRNbK4OdCUdyDJWZnal2bHI0gJ621BCZO/ZcpL3Z8Ue+ES23pD8QXdzBx5EW1z2ccpkE
 ci8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642907; x=1686234907;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1YdxCB85DjavEkSSztecs/1uZiFEj5gdNIdoSOu2jU=;
 b=Pb4OePTs1uv2iSf4X1fYEDkTzxnmh0q+8XUqo+N1qSAaue+Qpf6TqbNfbxoguJ2fnb
 ZF4PtuF80hqYHVDq/ovGpzSZlbmJFZoJZHdKFReNYeOsVz/mRmIFNbxDT/muMxT81WFc
 +3vJJ+yCczLTAZwHTH6REHZrHf279qA2qTjNvJV/95HeQoI/VUOqY1g5r+8OlZXsIbPx
 KZXiXKmOk/fKYMnpEpIlIgFHIkx2vWAyV0iQy1p+xA2wruuVEY1LzkggjoZXSY3nRU5g
 H+7c+uEUixGKQwNVqXiaIAD26rE4wOWgxHolQH8CK+045E6jwIl6Y/HfC58gsuzRQ/vT
 I6VA==
X-Gm-Message-State: AC+VfDxIuFefwwwyggvypD72eIiUWS0G4bKJCCr46kprU6EiHoBFUk7W
 RQRowG4t+DZghy4JopEMm5A=
X-Google-Smtp-Source: ACHHUZ5CsIMAIYa0KMYVoSFLvRU9hT596yzswoHdUDGZmpOnYS1VpOcagpzLja7w4fJycoNIhgFXXA==
X-Received: by 2002:adf:fa50:0:b0:307:a3e9:8b93 with SMTP id
 y16-20020adffa50000000b00307a3e98b93mr1960264wrr.2.1683642906530; 
 Tue, 09 May 2023 07:35:06 -0700 (PDT)
Received: from gmail.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 n3-20020a7bc5c3000000b003f0b1b8cd9bsm20181621wmk.4.2023.05.09.07.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 07:35:06 -0700 (PDT)
From: Juan Quintela <juan.quintela@gmail.com>
To: Mark Burton <mburton@qti.qualcomm.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  "afaerber@suse.de" <afaerber@suse.de>,  Alessandro
 Di Federico <ale@rev.ng>,  "anjo@rev.ng" <anjo@rev.ng>,
 "bazulay@redhat.com" <bazulay@redhat.com>,  "bbauman@redhat.com"
 <bbauman@redhat.com>,  "chao.p.peng@linux.intel.com"
 <chao.p.peng@linux.intel.com>,  "cjia@nvidia.com" <cjia@nvidia.com>,
 "cw@f00f.org" <cw@f00f.org>,  "david.edmondson@oracle.com"
 <david.edmondson@oracle.com>,  "dustin.kirkland@canonical.com"
 <dustin.kirkland@canonical.com>,  "eblake@redhat.com" <eblake@redhat.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,  "f4bug@amsat.org"
 <f4bug@amsat.org>,  Felipe Franciosi <felipe.franciosi@nutanix.com>,
 "iggy@theiggy.com" <iggy@kws1.com>,  Warner Losh <wlosh@bsdimp.com>,
 "jan.kiszka@web.de" <jan.kiszka@web.de>,  "jgg@nvidia.com"
 <jgg@nvidia.com>,  "jidong.xiao@gmail.com" <jidong.xiao@gmail.com>,
 "jjherne@linux.vnet.ibm.com" <jjherne@linux.vnet.ibm.com>,
 "joao.m.martins@oracle.com" <joao.m.martins@oracle.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,  "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>,  "mdean@redhat.com" <mdean@redhat.com>,
 "mimu@linux.vnet.ibm.com" <mimu@linux.vnet.ibm.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,  "stefanha@gmail.com"
 <stefanha@gmail.com>,  "wei.w.wang@intel.com" <wei.w.wang@intel.com>,
 "z.huo@139.com" <z.huo@139.com>,  "zwu.kernel@gmail.com"
 <zwu.kernel@gmail.com>
Subject: Re: QEMU developers fortnightly call for agenda for 2023-05-16
In-Reply-To: <70D7039C-F950-421C-A3A8-D5559DDD6E0C@qti.qualcomm.com> (Mark
 Burton's message of "Tue, 9 May 2023 14:25:41 +0000")
References: <calendar-f9e06ce0-8972-4775-9a3d-7269ec566398@google.com>
 <70D7039C-F950-421C-A3A8-D5559DDD6E0C@qti.qualcomm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 16:35:05 +0200
Message-ID: <87zg6dd146.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=juan.quintela@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 May 2023 11:45:33 -0400
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
Reply-To: juan.quintela@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Mark Burton <mburton@qti.qualcomm.com> wrote:
> I=E2=80=99d appreciate an update on single binary.
> Also, What=E2=80=99s the status on the =E2=80=9Cicount=E2=80=9D plugin ?

Annotated.

BTW, if people are interested I can expose the "idea" of all the
migration patches going on the tree.

Later, Juan.

