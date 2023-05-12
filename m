Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90637700193
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 09:36:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxNJS-0005hD-7J; Fri, 12 May 2023 03:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pxNJQ-0005gq-1e
 for qemu-devel@nongnu.org; Fri, 12 May 2023 03:35:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pxNJO-0003DU-2Q
 for qemu-devel@nongnu.org; Fri, 12 May 2023 03:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683876931;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJi6R2h6fr+KnyVNJLRe1xRS0/CMbNjx3YhKemzxNrw=;
 b=Mf+M2eFSKggx5kbEyFCYFKsphF0TgGob5A7lpQpzKLk2bz6rHw5226B3IOsDrpVjSSM1lp
 /ME/nHDwDdBSGl1XtV3KHcKgbbtWBeAgwWrPcEe2zeEvPJhJhbQoZ2+HTQmtfDGeO8hN+9
 8BfF5mi16zPEC7j0loO8DD+oSKQFq1c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-lfgehIqGPuas6gIyop-j9A-1; Fri, 12 May 2023 03:35:30 -0400
X-MC-Unique: lfgehIqGPuas6gIyop-j9A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f42d18a079so22279525e9.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 00:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683876929; x=1686468929;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJi6R2h6fr+KnyVNJLRe1xRS0/CMbNjx3YhKemzxNrw=;
 b=FbXrhTPgnf1yOT02Hl0DWPqoxZnRkbHebw29aFNTjXp/yd+EO9yMA4MZPFutBhNKtJ
 57WCunT9rFhm2AQifIaJF4Mq9ernkAKNLNcmFZRZwuxC5RKjJ/YZRe9cAsX7zbd+/DdJ
 8wDmG7nDs/9T+RDxfxDYcgj5Z7108Oo62DBq6t2iXYh21NNYHa1TRXU0FWaLgvr/aqqO
 UAGAVHe9mv26gkVI8zApcHQKtRI5GMkborrfrtxnFicFqIHKTF/cb5U3oZBBLiY/QZe6
 NfN715ZC73lRhmTC1CcMIG4+V9ormXoBkCBeUnk/LuzjWNj2Hv3DlePhE1PhP/nxhpne
 yncA==
X-Gm-Message-State: AC+VfDy7YOJJFpU2QslLbb88ASIs7Wp4+nlmIhVavRY9UknvtZAYkLTp
 TmxwL1mcVQkdIIDXJPZre/8jMAQI7umIv7SdhIQB+AAew9MNpn7lPJ2h6TrDg0uFObfRqbyl1p1
 ioXbc8e3YCGmqg6E=
X-Received: by 2002:a1c:6a18:0:b0:3f4:294d:8529 with SMTP id
 f24-20020a1c6a18000000b003f4294d8529mr10719260wmc.19.1683876929428; 
 Fri, 12 May 2023 00:35:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7wRZVuLj0kS1cyz5y8wEEXMI5SASxMVTfSl4nfYToCVeDTexo4f+uWfZhdbmPuul61yjY8og==
X-Received: by 2002:a1c:6a18:0:b0:3f4:294d:8529 with SMTP id
 f24-20020a1c6a18000000b003f4294d8529mr10719223wmc.19.1683876929097; 
 Fri, 12 May 2023 00:35:29 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 s18-20020a5d4252000000b00304aba2cfcbsm22737813wrr.7.2023.05.12.00.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 00:35:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: afaerber@suse.de
Cc: ale@rev.ng,  anjo@rev.ng,  bazulay@redhat.com,  bbauman@redhat.com,
 chao.p.peng@linux.intel.com,  cjia@nvidia.com,  cw@f00f.org,
 david.edmondson@oracle.com,  dustin.kirkland@canonical.com,
 eblake@redhat.com,  edgar.iglesias@gmail.com,
 elena.ufimtseva@oracle.com,  eric.auger@redhat.com,  f4bug@amsat.org,
 Felipe Franciosi <felipe.franciosi@nutanix.com>,  "iggy@theiggy.com"
 <iggy@kws1.com>,  Warner Losh <wlosh@bsdimp.com>,  jan.kiszka@web.de,
 jgg@nvidia.com,  jidong.xiao@gmail.com,  jjherne@linux.vnet.ibm.com,
 joao.m.martins@oracle.com,  konrad.wilk@oracle.com,  kvm@vger.kernel.org,
 mburton@qti.qualcomm.com,  mdean@redhat.com,  mimu@linux.vnet.ibm.com,
 peter.maydell@linaro.org,  qemu-devel@nongnu.org,
 richard.henderson@linaro.org,  shameerali.kolothum.thodi@huawei.com,
 stefanha@gmail.com,  wei.w.wang@intel.com,  z.huo@139.com,
 zwu.kernel@gmail.com
Subject: Re: QEMU developers fortnightly call for agenda for 2023-05-16
In-Reply-To: <calendar-f9e06ce0-8972-4775-9a3d-7269ec566398@google.com> (juan
 quintela's message of "Tue, 09 May 2023 12:06:42 +0000")
References: <calendar-f9e06ce0-8972-4775-9a3d-7269ec566398@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 12 May 2023 09:35:27 +0200
Message-ID: <871qjm3su8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

juan.quintela@gmail.com wrote:
> Hi If you are interested in any topic, please let me know. Later, Juan.

Hi folks

So far what we have in the agenda is:

questions from Mark:
- Update on single binary?
- What=E2=80=99s the status on the =E2=80=9Cicount=E2=80=9D plugin ?
- Also I could do with some help on a specific issue on KVM/HVF memory hand=
ling

From me:
- Small update on what is going on with all the migration changes

Later, Juan.


> QEMU developers fortnightly conference call
> Tuesday 2023-05-16 =E2=8B=85 15:00 =E2=80=93 16:00
> Central European Time - Madrid
>
> Location
> https://meet.jit.si/kvmcallmeeting=09
> https://www.google.com/url?q=3Dhttps%3A%2F%2Fmeet.jit.si%2Fkvmcallmeeting=
&sa=3DD&ust=3D1684065960000000&usg=3DAOvVaw14RNXU52XvArxijoKSmVbR
>
>
>
> If you need call details, please contact me: quintela@redhat.com
>
> Guests
> Philippe Mathieu-Daud=C3=A9
> Joao Martins
> quintela@redhat.com
> Meirav Dean
> Felipe Franciosi
> afaerber@suse.de
> bazulay@redhat.com
> bbauman@redhat.com
> cw@f00f.org
> dustin.kirkland@canonical.com
> eblake@redhat.com
> edgar.iglesias@gmail.com
> eric.auger@redhat.com
> iggy@theiggy.com
> jan.kiszka@web.de
> jidong.xiao@gmail.com
> jjherne@linux.vnet.ibm.com
> mimu@linux.vnet.ibm.com
> Peter Maydell
> richard.henderson@linaro.org
> stefanha@gmail.com
> Warner Losh
> z.huo@139.com
> zwu.kernel@gmail.com
> Jason Gunthorpe
> Neo Jia
> David Edmondson
> Elena Ufimtseva
> Konrad Wilk
> ale@rev.ng
> anjo@rev.ng
> Shameerali Kolothum Thodi
> Wang, Wei W
> Chao Peng
> kvm-devel
> qemu-devel@nongnu.org
> mburton@qti.qualcomm.com


