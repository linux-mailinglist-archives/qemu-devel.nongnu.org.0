Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854795EDA95
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:53:04 +0200 (CEST)
Received: from localhost ([::1]:33126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUgY-0006Rm-Jr
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTE2-0003qp-Ig
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odTDz-0000j3-Ss
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664356766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3iRlNT3tI+FPUDSQud0vfbyrJZ1IryRGfi3hzQU/u8=;
 b=fKBaAhAVCEwkPQMUlzKo4JTjTPQB74vwszhH7wyV2cxs5mUJj8kHq5cCHu07I9IpDtwytl
 w1PumJYoDS/kE0RA7zzdUI8R5NzajXmW0sMz+azVW1k7wtStLeuKH8Tz7qDwuSpg7VAVsP
 pxora6r1apMQ6w9gQjdN8E9Sxa+ibMo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-keEwgRMDPGm70EBWQlnPtA-1; Wed, 28 Sep 2022 05:19:23 -0400
X-MC-Unique: keEwgRMDPGm70EBWQlnPtA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b5-20020a05600c4e0500b003b499f99aceso877159wmq.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=k3iRlNT3tI+FPUDSQud0vfbyrJZ1IryRGfi3hzQU/u8=;
 b=XK8qyAwm7XlfaMtB6vJzzy1HilEVi4iqhtB03n9SW7dHjXBNaxz7y+0kbO1US9rSM6
 PjuRgjgqYCUhTAA7M+4lU5m+D5mzzya3aAs+BnIuPnfP/gYlT/qRNBOux1QLQH2hDLrJ
 LJ9Yg0fJdn9lmxsd258FlzZ0qGjdcw7XV21kqTZ4HU7uG156yaG//UB7mkGtbIwaZy9Y
 qvsvdcSTZxFQhR7QY+X3WLaO57qUspc8snO9Yq1qP521PjgmV0av0VAGidxxVa//iiCD
 kQVHw8xtQmyrQr9T8EeygWuh1OW+wwlzl6BdvmRWWrxIXRiLLtSMPPsMxrXkmeMJ2foo
 0nhg==
X-Gm-Message-State: ACrzQf15hEicxseLI/Og/dwgqCxVOmtn+kyP3Wl3GwvH0g3jlLDexi4h
 6h3XAv/8vdyGdkkilnOYOsHWRfJLJWArqwIP6d3ljaswqvvarXOW8xTfl/jMlIvADtRigoMMmNs
 UpiKuW+AMJDWFfpA=
X-Received: by 2002:adf:d215:0:b0:228:6293:10ff with SMTP id
 j21-20020adfd215000000b00228629310ffmr19929276wrh.171.1664356761906; 
 Wed, 28 Sep 2022 02:19:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM592Q8/Pdt5jbANVgTxSUsPrFCHVv207SbZMfANsw7OVRU7QHfr8NDaFyGOOOm0tOY6DV6knA==
X-Received: by 2002:adf:d215:0:b0:228:6293:10ff with SMTP id
 j21-20020adfd215000000b00228629310ffmr19929254wrh.171.1664356761680; 
 Wed, 28 Sep 2022 02:19:21 -0700 (PDT)
Received: from redhat.com ([2.55.17.78]) by smtp.gmail.com with ESMTPSA id
 k3-20020a05600c1c8300b003b497138093sm1080921wms.47.2022.09.28.02.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 02:19:21 -0700 (PDT)
Date: Wed, 28 Sep 2022 05:19:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220928051727-mutt-send-email-mst@kernel.org>
References: <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <20220927171601-mutt-send-email-mst@kernel.org>
 <YzPwkqRexae1MjG/@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YzPwkqRexae1MjG/@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Wed, Sep 28, 2022 at 07:58:46AM +0100, Daniel P. Berrangé wrote:
> biosbits isn't tied to QEMU versions, it is an entirely separate 3rd
> party project. This binary is just providing the test env, and IIUC,
> control over what executes in this env is still done by the QEMU side
> test scripts. I'm not seeing a coupling here that requires precise
> matching. In any case biosbit is a dead project so does not look
> likely to have any changes.
> 
> If we did want to have different versions though, we can stil
> publish artifacts from different branches of biosbits code. Gitlab
> will preserve & publish the latest artifacts from each branch in
> parallel.
> 
> With regards,
> Daniel

The issue is bugs, testing, support.  If biosbits needs to support old
qemu versions that's a ton of work for no real benefit.  CI is CI, it's
not a binary distribution mechanism, abusing it will just lead to
problems down the road... my $.02

-- 
MST


