Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4E95FB26F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:30:00 +0200 (CEST)
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEOU-0007Dv-P7
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCbM-0007br-Ic
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:35:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCbK-0006IN-7Z
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=LJgY/NC9iDbCJ02T7z7OARSSuT1RK7Z579pL3jWZEbqqbjUActeM3vdhzUmyNu7meGYxOc
 pJHalfsV1JXoZmG2lUiaI8EYHiEKHIEI3WojD6gvXb96j/JEXvdyjEwAxwaV43ECtdZ5F6
 6hnO61Mnic97AoQ8RqzBFxZ9d0qGGps=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-UyUf1mc_NquKLUMfjdZ-9w-1; Tue, 11 Oct 2022 06:35:01 -0400
X-MC-Unique: UyUf1mc_NquKLUMfjdZ-9w-1
Received: by mail-ed1-f70.google.com with SMTP id
 v4-20020a056402348400b0045bd50cb9adso5624980edc.0
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=JDpKAa0lWAnXfdaVkC1AzElhw2gN6sBbkx7Un66849pe1JdmCssMMRowUj/kIOBiS2
 NDa8AXuupK2YclTdv3/XbpcOCjfn56niNgyLgYPBSyYMfnHQC9gkUM8pHq3Zoj/FRTv/
 3DJ7sQHLcZV09UA8JFkPl/r6B+VpKlH0MFGpdfsnnTXWd8ZY5FOtCj0vpyg0H/0GLqb0
 ilTym6snFeLpFMJDEMk+jOyOvqcwXBkaJlGGDLgf7wvXAqGeyQDrcxTln4FPYQVLbTrm
 VIPCwxTcMILBJ8gdx2fezBRj6via1VB8oW9aMS75mOqu4uH+xIFicNqVsXAS+z7fI7me
 CtzA==
X-Gm-Message-State: ACrzQf16OnqQI80ZtJHx6pPa5hozynm3f5QE8KcVFPrOkfy18kz0LV8s
 4K+oTjy1aMZ7WiakuvWY7jVLsXW9YVpWm4kF8xiXey4gSHXm4JBMdudJza3EcYQXvxqcXXgc1wY
 BmcBlkXvu0TMRx1w=
X-Received: by 2002:aa7:cc13:0:b0:453:52dc:1bbf with SMTP id
 q19-20020aa7cc13000000b0045352dc1bbfmr22140204edt.30.1665484500222; 
 Tue, 11 Oct 2022 03:35:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4sRrEs4pidR3T3eb/sH0Py792WiV0yQIyokIRL6wyxioImdhqzr/F0WvbF5f/Grrjn2YDSFg==
X-Received: by 2002:aa7:cc13:0:b0:453:52dc:1bbf with SMTP id
 q19-20020aa7cc13000000b0045352dc1bbfmr22140189edt.30.1665484500034; 
 Tue, 11 Oct 2022 03:35:00 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906300200b0077a11b79b9bsm2438849ejz.133.2022.10.11.03.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:34:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Venu Busireddy <venu.busireddy@oracle.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
Date: Tue, 11 Oct 2022 12:34:56 +0200
Message-Id: <20221011103456.320555-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006194946.24134-1-venu.busireddy@oracle.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Queued, thanks.

Paolo


