Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF79D6E6676
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:59:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polr3-0004ZV-6D; Tue, 18 Apr 2023 09:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1polqw-0004YQ-Ac
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:58:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1polqu-0006fm-LG
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:58:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f177cb2c6cso6182595e9.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 06:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681826315; x=1684418315;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGySRZrs/b8njlSGrjtzjuPbx1JL14da6i8ba99Is3E=;
 b=uk+TxpZt6Ud9SwLze7/gzjXKw05Yu1KtKb35B0tsS7PBU94thWt40bsBQnk2eF3LsF
 VGSF2UHy7yiyV5v6l/Gxgwj0jlGWNW9Te+lqm4FvHAnXUpgRaF2V8+DTK1OjIAL056cF
 N4O8xbZEp5M498yKXJH7206ctyhRYvPnxffgyqwrjQTmo8+IYkw+QXK5e5H19mmPYd5H
 IBOO4vmjkGlDCbsUv4ZTgdQLOftAPmdBfGF9lttDBsoJkk/Iczz+ZZDoYZsqu9/vGqBJ
 hvdgbi+wMT3v/louhp5fKk6IZQWPLw42nGZlTIsgV5WzDz6K8C3dCJoaIcDXfMS4+kUy
 oK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681826315; x=1684418315;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vGySRZrs/b8njlSGrjtzjuPbx1JL14da6i8ba99Is3E=;
 b=Kp42DUBDjhT/91uQIlqzZWwlkxHsKhPJikqbgon+WSYh70EAGULxmPtNmfv0PStpvF
 VpnVCCSWpffaO8jIl4HfAxxxGQONaI5DI2qXEXVsSqoDi0M1TYO4WpEW/W7o0dMkVBpA
 lFxNmqvUpXbGjHyYRoHJcUREiFAr0TX+1I4O2I9hNbSnhPwy2hQGCvSKGx31SzJzCWe6
 Zu2bYK/Kjx2JPeLPo3vAL1w2GQS9OiO+DPHuI5GOgj7NrwkOLGlwgHyWTeOCVhAmxud5
 ESra/SXlcaNop2305zvxZDCCnrzVpegS/tgur/aZa8SY1Pddr9EQluFOxYSlIsMvMjPn
 qkfw==
X-Gm-Message-State: AAQBX9fr8utHZ1ztc/L6LZg7MRqc4PoyBUm+yEmA/zgsFVN8uVYtMs8j
 3ebI+EChc1OCWHyqE9+4rTPX7A==
X-Google-Smtp-Source: AKy350azYH1QyIZJteWYhrBdTdgAMIOcRSwIxrUCxuU8o70MwNtV3fnTEbrIsFDkwL4jPZWFqPVqlQ==
X-Received: by 2002:a5d:6a06:0:b0:2f0:2dfe:e903 with SMTP id
 m6-20020a5d6a06000000b002f02dfee903mr2236438wru.69.1681826314647; 
 Tue, 18 Apr 2023 06:58:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b7-20020adfde07000000b002f3fcb1869csm13179900wrm.64.2023.04.18.06.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 06:58:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9FA01FFB7;
 Tue, 18 Apr 2023 14:58:33 +0100 (BST)
References: <calendar-8e6a5123-9421-4146-9451-985bdc6a55b9@google.com>
 <87r0sn8pul.fsf@secure.mitica>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: quintela@redhat.com
Cc: afaerber@suse.de, juan.quintela@gmail.com, ale@rev.ng, anjo@rev.ng,
 bazulay@redhat.com, bbauman@redhat.com, chao.p.peng@linux.intel.com,
 cjia@nvidia.com, cw@f00f.org, david.edmondson@oracle.com, Eric Northup
 <digitaleric@google.com>, dustin.kirkland@canonical.com,
 eblake@redhat.com, edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com,
 eric.auger@redhat.com, f4bug@amsat.org, Felipe Franciosi
 <felipe.franciosi@nutanix.com>, "iggy@theiggy.com" <iggy@kws1.com>, Warner
 Losh <wlosh@bsdimp.com>, jan.kiszka@web.de, jgg@nvidia.com,
 jidong.xiao@gmail.com, jjherne@linux.vnet.ibm.com,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com, kvm@vger.kernel.org,
 mburton@qti.qualcomm.com, mdean@redhat.com, mimu@linux.vnet.ibm.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, shameerali.kolothum.thodi@huawei.com,
 stefanha@gmail.com, wei.w.wang@intel.com, z.huo@139.com,
 zwu.kernel@gmail.com
Subject: Re: QEMU developers fortnightly conference call for agenda for
 2023-04-18
Date: Tue, 18 Apr 2023 14:57:53 +0100
In-reply-to: <87r0sn8pul.fsf@secure.mitica>
Message-ID: <87leipe1h2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Juan Quintela <quintela@redhat.com> writes:

> Hi
>
> Please, send any topic that you are interested in covering.
>
<snip>
>
>  Call details:

Please find the recording at:

  https://fileserver.linaro.org/s/nJTSCLyQBfo6GLJ

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

