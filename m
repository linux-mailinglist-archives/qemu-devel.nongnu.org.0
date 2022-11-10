Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E038624C36
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 21:54:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otEYF-0001b7-GX; Thu, 10 Nov 2022 15:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otEYD-0001ah-6x
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:53:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otEY9-0005ur-J1
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668113604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SxhSfOF+gFiqLBizW5SjlIfxg5dJOTRKKpjjrolLiic=;
 b=AtX/sRh6x24wte06axtFReud2krcyQx6czGXQ0ohx1WJZHiFy646e11MKVgJH4wpIgRnOU
 SqqlAxvz8ni0YQM3bg7Gl3G1Fp9OPHOfISozoqplSaUFXR44zJ/n9AtY0cvJn8F7dizGlj
 LPfrgxIWKsdIdjZ0MSXWlFOyfbAw7wA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-pvBuGODZPVaDjzJHjkc5Mw-1; Thu, 10 Nov 2022 15:53:22 -0500
X-MC-Unique: pvBuGODZPVaDjzJHjkc5Mw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h204-20020a1c21d5000000b003cf4e055442so1535804wmh.1
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 12:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SxhSfOF+gFiqLBizW5SjlIfxg5dJOTRKKpjjrolLiic=;
 b=HeJpHKF3fiSa9malao5TIVFSJClae1/Fy9icfC9x+xUpkgz5xry7R3jr4PiDRjiL+I
 KlKNx3PnuaImL6V2ImogtOxF5q3ejOQ7IR/cal7v9uJ/aPwSEYzLSSbHv/Qd/nvwz/vN
 LxVVz/Hl+E3cpTviQVglyV8IoWu5AlRFdVASbqFf91Xn1STpt1V+qr/0SaRq9coHrTpk
 Xn20QBXAphG5u2eseaA2moldbT7pml93ablKQI1ZvLxACjkTPkHaycKNX+2PMYk70NZ3
 rfEVPJF1W4xKvIPproDQONoceTqacy1fhfBH/Ga+p2RzrX+sSbsFy8lUf/ZpiAYBKywZ
 fQNA==
X-Gm-Message-State: ACrzQf0UpOUHTx3kDGLmBEmz41HeBJTx5GNPmRdFJ2YABXcSIFkfpCVn
 ZCpwsn+MFpv8ryJAk+5UP/FUhjewQ16mi5DryrghqhG75xFY7rbR5Se2Sd6qJaWIyGIwUY/jgaA
 wvyy2cC9m8viQBGI=
X-Received: by 2002:adf:dc8a:0:b0:236:6372:551e with SMTP id
 r10-20020adfdc8a000000b002366372551emr41859539wrj.41.1668113601628; 
 Thu, 10 Nov 2022 12:53:21 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5uiX7E5/U00K46h20skMOW57cPh4IbB1wLVgrncm+T7rwavC/kXagFEBtwIV7p7aix3bRhig==
X-Received: by 2002:adf:dc8a:0:b0:236:6372:551e with SMTP id
 r10-20020adfdc8a000000b002366372551emr41859521wrj.41.1668113601396; 
 Thu, 10 Nov 2022 12:53:21 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 s13-20020adfea8d000000b00228d67db06esm157021wrm.21.2022.11.10.12.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 12:53:20 -0800 (PST)
Date: Thu, 10 Nov 2022 15:53:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v3 0/7] memory: prevent dma-reentracy issues
Message-ID: <20221110155240-mutt-send-email-mst@kernel.org>
References: <20221028191648.964076-1-alxndr@bu.edu>
 <CAJSP0QXf3ZiNOQc7ok8Wq6C5np+Q7SDuXu6jmuMivxq6RkGFQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QXf3ZiNOQc7ok8Wq6C5np+Q7SDuXu6jmuMivxq6RkGFQA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Nov 10, 2022 at 03:50:51PM -0500, Stefan Hajnoczi wrote:
> Preventing this class of bugs is important but QEMU is currently
> frozen for the 7.2 release. I'm a little concerned about regressions
> in a patch series that changes core device emulation code.
> 
> I'll review the series on Monday and if anyone has strong opinions on
> whether to merge this into 7.2, please say so. My thoughts are that
> this should be merged in the 7.3 release cycle so there's time to work
> out any issues.
> 
> Stefan

Stefan, what you say here makes total sense to me.
Didn't look at the series either yet.

-- 
MST


