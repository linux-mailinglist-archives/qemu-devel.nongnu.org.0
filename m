Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E483E4E6C15
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 02:36:31 +0100 (CET)
Received: from localhost ([::1]:42634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXYsQ-0007Gj-Nk
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 21:36:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nXYre-0006bD-Au
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 21:35:42 -0400
Received: from [2607:f8b0:4864:20::636] (port=42905
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nXYrc-0004sK-VM
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 21:35:41 -0400
Received: by mail-pl1-x636.google.com with SMTP id p17so6587389plo.9
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 18:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rCO5xCPhDILvckAs1DWy7jjaavYTT5p+k0wQ03BON1s=;
 b=jJxzoyGo/jbSrD3YG2JjZXPep7kMLHmxwW6vSfAXfHLVteVWPtNXhIGQNkEG/V4PGX
 T9gTyNQFtZxoNXDu7zp+myJxPpyaCxekqpU67HPonBLL2h7XS4sNRnziOFMvtRVofxmo
 5boBhKOfowBY8xZ/ItCWRu4l6uii4ZfC/+jYwYFTp3tNeW2mpWfC5/evH9pf6H9EwMLl
 gkjPvPzZKpn+Skj9TKMS+yj3yN3mj2kRTT5qymlrEJfi8Smy2GMvLce0i/JLDir5B2dT
 yiHAmPbXb4K3ljPe7va5an5TTsrqe1SrRTqiDtbxi0u5h8P0RLHNEutM4ZReEd5wQ48W
 rKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rCO5xCPhDILvckAs1DWy7jjaavYTT5p+k0wQ03BON1s=;
 b=P2bqczhiQ6IpS/q6OsFaTp/T+VO5Lr16rI3fGy0CE6aOpntIB/qgP7znspxBKmzMDk
 DIXwIDOOYKp/b6sThV79ghSO6XduXzV35lWc7hYERlgq2seU9Iq8Avtyws5PbeG4pBhM
 s1a3vMNOP4UI2bzNB7B08uFWLjf19w26d5cQCgHq2Tm1EXmVJqCtzdBZP4y3vE3eP7BX
 I2Px0SJPauCnCNNdhZkmpJRDDOml8xryXPtJCL0XMiNTV2pMBDN2XO0bJ2eOZYpH1a4Z
 nLCDq8D47lm6mgPWp67LKu3sye8pMgHH3hFaRkehGm11FBX20QJnk4SlJmZyi5O3Wy/8
 6aQw==
X-Gm-Message-State: AOAM532SQtKdmVJ9Ond6XtIpfBP6Ab2lZ2p4ntmcND0TluIASNihBJMC
 8DdwfsF71KO5lSIJfn7ESiU=
X-Google-Smtp-Source: ABdhPJzV8t3K39iGcanesqu8Uhy9Iu/kxOvIrFqahEV1vqUxabyoGzYMlPJ/9ugwu1+oeLpXn2bniA==
X-Received: by 2002:a17:90a:1a:b0:1c6:c1ee:c3fb with SMTP id
 26-20020a17090a001a00b001c6c1eec3fbmr22086302pja.50.1648172136859; 
 Thu, 24 Mar 2022 18:35:36 -0700 (PDT)
Received: from localhost ([192.55.54.52]) by smtp.gmail.com with ESMTPSA id
 u9-20020a056a00158900b004faad3ae570sm5036781pfk.189.2022.03.24.18.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 18:35:36 -0700 (PDT)
Date: Thu, 24 Mar 2022 18:35:34 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC PATCH v3 12/36] i386/tdx: Add property sept-ve-disable for
 tdx-guest object
Message-ID: <20220325013534.GA1229975@ls.amr.corp.intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-13-xiaoyao.li@intel.com>
 <20220322090238.6job2whybu6ntor7@sirius.home.kraxel.org>
 <b452d357-8fc2-c49c-8c19-a57b1ff287e8@intel.com>
 <20220324075703.7ha44rd463uwnl55@sirius.home.kraxel.org>
 <4fc788e8-1805-c7cd-243d-ccd2a6314a68@intel.com>
 <20220324093725.hs3kpcehsbklacnj@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324093725.hs3kpcehsbklacnj@sirius.home.kraxel.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Cornelia Huck <cohuck@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 seanjc@google.com, erdemaktas@google.com, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 10:37:25AM +0100,
Gerd Hoffmann <kraxel@redhat.com> wrote:

> > #VE can be triggered in various situations. e.g., CPUID on some leaves, and
> > RD/WRMSR on some MSRs. #VE on pending page is just one of the sources, Linux
> > just wants to disable this kind of #VE since it wants to prevent unexpected
> > #VE during SYSCALL gap.
> 
> Linux guests can't disable those on their own?  Requiring this being
> configured on the host looks rather fragile to me ...

Guest can get the attributes. (But can't change it).  If the attributes isn't
what the guest expects, the guest can stop working itself.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

