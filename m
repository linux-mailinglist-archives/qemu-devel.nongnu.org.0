Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFA0413279
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 13:27:28 +0200 (CEST)
Received: from localhost ([::1]:47302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSdvq-0001q9-Qc
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 07:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSdsq-0004W6-8f
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 07:24:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSdsl-0001TT-2c
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 07:24:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632223453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8oVU5J6PJ2Yb/o2AKc8tjjovDSrHX4o+yQN2hVP2e4=;
 b=XaLubb5+RiEIZnxIh7Y7qoSngpnXUSjtkdpXRlpxB5mPcfmgQsHRob+WYxWomG5cC+AiDn
 yyowUcwtv97ParcFEE5d2WI5nyhjTcmnR3051pYZY3S1WcYIuj9zWeYH9ZC9yFqIhTBMnW
 7M2UeU26rucXRB36nKE7gI1fuEr5Szk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-Yu0Cw__GPUWeNijYl77pqQ-1; Tue, 21 Sep 2021 07:24:12 -0400
X-MC-Unique: Yu0Cw__GPUWeNijYl77pqQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c7-20020a05640227c700b003d27f41f1d4so18671615ede.16
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 04:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8oVU5J6PJ2Yb/o2AKc8tjjovDSrHX4o+yQN2hVP2e4=;
 b=BUsjHVlhzKhs+tNuphpxivfCjHoM5h42gwL2R8gKkgmoaQ1BkuKsMyrUc/1Cv4hY15
 vjrMxXidjZEsPNpJ23BEVI2hJ26IZpQmkzXCJ+IsebC7evrdp53bjO2mLPk79fGRwLY2
 i/retAtVtUzkcPKQd7J9WcXOYBo1PbglTEjAgVHQ99/M9fF7SXB6uyKB3Ee6wcJ/cYo4
 NrRwjj9hzlYeQSS8BP6fjYHO6fVMMenwKdVZyaKfSX63g8uWmv0GPtxn4f1+XmVo3X1Q
 rixCaTFV7wyjx+d1PFOO5BmTMpAmH170B8oV+w+SaljKy/RNp6eRfll+sTuYFaVMtPkn
 /01w==
X-Gm-Message-State: AOAM531sFAVgag1VJRSP92AhJuwEr7gSQajwS4mABHQwvgQ5zyDM3EYu
 z2OGzC896HFhmYjlAEjdLzvGzXFVm2ppPi0j/ylYSElMGjzrXH5NngJVubBVYcBpks2ilVj90t/
 eGc98g3SaRZvmvD0=
X-Received: by 2002:a17:906:7047:: with SMTP id
 r7mr33542302ejj.342.1632223451040; 
 Tue, 21 Sep 2021 04:24:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx88XPDX0eTuZBraviOAo9+4qokGGxPyw0sbH9NiovyOBzn+CyLe1DGG7WZ8TdqBJjnlEcSAg==
X-Received: by 2002:a17:906:7047:: with SMTP id
 r7mr33542280ejj.342.1632223450805; 
 Tue, 21 Sep 2021 04:24:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id f18sm3757408edt.60.2021.09.21.04.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 04:24:10 -0700 (PDT)
Date: Tue, 21 Sep 2021 13:24:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v6 10/10] ACPI ERST: step 6 of bios-tables-test
Message-ID: <20210921132409.596f6a03@redhat.com>
In-Reply-To: <1628202639-16361-11-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-11-git-send-email-eric.devolder@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 18:30:39 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Following the guidelines in tests/qtest/bios-tables-test.c, this
> is step 6, the re-generated ACPI tables binary blobs.


commit message should include ASL diff for new/changed content

for example see commit:
1aaef7d8092803 acpi: unit-test: Update WAET ACPI Table expected binaries

> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
>  tests/data/acpi/pc/DSDT                     | Bin 6002 -> 6009 bytes
>  tests/data/acpi/pc/ERST                     | Bin 0 -> 912 bytes
>  tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8306 bytes
>  tests/data/acpi/q35/ERST                    | Bin 0 -> 912 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   6 ------
>  6 files changed, 6 deletions(-)
>  create mode 100644 tests/data/acpi/microvm/ERST.pcie
> 
> diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
> new file mode 100644
> index 0000000000000000000000000000000000000000..d9a2b3211ab5893a50751ad52be3782579e367f2
> GIT binary patch
> literal 912
> zcmaKpO%8%E5QPUQ|KVrvh9h_c12J)@5f?5!k_Ygv*jGA8UW7?#`}+D#XXyDpKHiZ?
> z@anI_W$gOrZRl(SB7!yMqx}#E4EC&a5=}m^g_!0^0`kEl)DOuIXM6D@@*xq*8vyqH
> z)b0KTlmlgmH~xt7vG<k#Z1~z=OnyT76ZX;Ysy^;NC0^^$`kY?zKK;^vMtny1JAD$P
> zc^BR{l;i*H`IJAW`~~?1`_TXD_wQ2@UlL!DU$GCpQ-4i-O}x_^JdQTRH^e)=(_c$`
> LOT5z?_v4Aa+v(5&
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
> index cc1223773e9c459a8d2f20666c051a74338d40b7..bff625a25602fa954b5b395fea53e3c7dfaca485 100644
> GIT binary patch
> delta 85
> zcmeyQ_fwC{CD<jTQk;Q-F=QiG057Ni!kGAAr+5MP$;rGe;+`zQh8FQ0@s2J*JPZuX
> l3>=QZp?+M<lN)&@ggD~CY!RV&S1$v`0B2XP&5C@1oB+Xc6m$Rp  
> 
> delta 65
> zcmeyV_eqb-CD<jTNSuLzao$F*0A5ayg)#BLPVoW`laqN{#GF`y4K3n1;)6r|xR^QO
> V9bJNW7#Nr*U*I#`Y|7`t2>@&@5ljF8  
> 
> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
> GIT binary patch
> literal 912
> zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2  
> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
> zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
> R+q~0XMSexT%^U0Ee0~)`g#iEn
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
> index 842533f53e6db40935c3cdecd1d182edba6c17d4..950c286b4c751f3c116a11d8892779942375e16b 100644
> GIT binary patch
> delta 59
> zcmaFp@X3M8CD<jTNP&TYv2`OCrvjHhYfOBwQ@nsX>ttC4TZ!l<{$N9cc#e2SmmnSn
> O1||j(wg6|p5C#C(xDBxY
> 
> delta 42
> xcmez5@X&$FCD<h-QGtPh@##h`P6aMMmYDcpr+5K3mdUaTw(KHo0nUCQ3;+kH3ZMW0
> 
> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
> GIT binary patch
> literal 912
> zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2  
> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
> zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
> R+q~0XMSexT%^U0Ee0~)`g#iEn
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index b3aaf76..dfb8523 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,7 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/pc/ERST",
> -"tests/data/acpi/q35/ERST",
> -"tests/data/acpi/microvm/ERST",
> -"tests/data/acpi/pc/DSDT",
> -"tests/data/acpi/q35/DSDT",
> -"tests/data/acpi/microvm/DSDT",


