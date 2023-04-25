Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C496EDE8B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 10:52:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prEOq-0005Ge-VY; Tue, 25 Apr 2023 04:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1prEOo-0005G0-QP
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:51:46 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1prEOm-0000K6-A3
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:51:46 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so36809945e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682412702; x=1685004702;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0uWY7brqmRcXtVhZrcEFbqRw/mI47vo48/ZwQf8LM0=;
 b=CVPdtHcb6/onOq1WIDibJiKW2+L8E5SE0fW3D5KFSkyvX17mEzrLHIIexwecFFX2HW
 z64w2n2+/SDqzwua8AggwNS0fR933cVzmRApXoofVnU3whAPgdliqjXXKKt1+xrkD1v+
 kZHJUCOuNGuUXAsos4N12QDYZfs+1rKo5l7b5r57U7plsOOkf784rUyh/tWUx/ABh6zy
 l8YvQuI4PK4Gydz+GY7ap5t6UUoO0LKuD9SizmskuuWPblecgDY9e5pG2iBRcuPW/rye
 FrIOLS79bCG+pU+d53Gecq98625XmbOt8qEpGryu1l1p9J19RzpdujRomvhrsvks2gNe
 ok4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682412702; x=1685004702;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0uWY7brqmRcXtVhZrcEFbqRw/mI47vo48/ZwQf8LM0=;
 b=N9VwRIVV99tXCY/yVsPX/Li3uq8SaTd0ZD3d1+IbUiHp7zO5oHuJfpUVMNyGbiBk06
 8LVZ489hLcRI7MTnpqWx4iFuv+7oCp5eAuSYwIlsRONJeYje7We36ECup004ToU9Jom4
 oNOh6sf7nQhg1k2IurzBd34Ba8EGQeEVUlTAVk5ETXYUuMYcyXCjXjV2S55WSa4SMSq8
 8cdFxEz80kKqCOPz2TEzjbGi8xc+AnLJoynxDbcYx0w1NwnJPQpzp7JpS2N4QGDXJwpy
 BpO8195Z/pjbVvog8oBIZsj1XeoyEM+3tnF32R53pvS/pY3bGPlcFuRNS4h9KYrmBVq/
 Mmhw==
X-Gm-Message-State: AAQBX9cb9HTaYyclVc6f8XBfF7fCa6VvBV1nmu1qI3rUsFe7U2lJ2sOn
 ivbb7my0gfBPTS8x2Cce49zfLw==
X-Google-Smtp-Source: AKy350ZUDANoRxBtQ9SFoMrQs3nNPESbgqKXUBOzf9AWOosDfWWewz5EhFWtDHxGnGlu3xM/k7MiWQ==
X-Received: by 2002:a1c:7912:0:b0:3f1:94e2:e5cf with SMTP id
 l18-20020a1c7912000000b003f194e2e5cfmr9189741wme.34.1682412702184; 
 Tue, 25 Apr 2023 01:51:42 -0700 (PDT)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 i40-20020a05600c4b2800b003ee6aa4e6a9sm17589228wmp.5.2023.04.25.01.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 01:51:41 -0700 (PDT)
Date: Tue, 25 Apr 2023 09:51:42 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 mtosatti@redhat.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org,
 peter.maydell@linaro.org, chenhuacai@kernel.org,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Subject: Re: [PATCH] kvm: Merge kvm_check_extension() and
 kvm_vm_check_extension()
Message-ID: <20230425085142.GA976713@myrica>
References: <20230421163822.839167-1-jean-philippe@linaro.org>
 <87jzy1v3gd.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzy1v3gd.fsf@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Apr 24, 2023 at 03:01:54PM +0200, Cornelia Huck wrote:
> > @@ -2480,6 +2471,7 @@ static int kvm_init(MachineState *ms)
> >      }
> >  
> >      s->vmfd = ret;
> > +    s->check_extension_vm = kvm_check_extension(s, KVM_CAP_CHECK_EXTENSION_VM);
> 
> Hm, it's a bit strange to set s->check_extension_vm by calling a
> function that already checks for the value of
> s->check_extension_vm... would it be better to call kvm_ioctl() directly
> on this line?

Yes that's probably best. I'll use kvm_vm_ioctl() since the doc suggests
to check KVM_CAP_CHECK_EXTENSION_VM on the vm fd.

Thanks,
Jean

> 
> I think it would be good if some ppc folks could give this a look, but
> in general, it looks fine to me.
> 

