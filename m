Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F269D7FC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 02:27:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUHQh-0005d1-JS; Mon, 20 Feb 2023 20:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUHQT-0005LI-Ks
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 20:26:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUHQS-0006Nu-7d
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 20:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676942795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KFzJoPpQR828IFWcqDBD5WZaRShdxGvqXxLiMsT+Aao=;
 b=RqgTrcIxkLdaIdCx8kc74aPgksaduCwIm7wW3OIDf6TkRiD7kMBNDptUeEE19l/PN4j9K6
 1wubPM0HgujZ89loskqeOf4UOWHsoFVQloBGLjkoMSSO5R1/JGuMJ9mUA9sTfOy1m9038W
 iZKRpH3Swn0LVeAH5X71OH8o4eC2diE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-wtU4HwF_Nz6had69rAUdIw-1; Mon, 20 Feb 2023 20:26:33 -0500
X-MC-Unique: wtU4HwF_Nz6had69rAUdIw-1
Received: by mail-pf1-f198.google.com with SMTP id
 bw25-20020a056a00409900b005a9d0e66a7aso2090046pfb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 17:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KFzJoPpQR828IFWcqDBD5WZaRShdxGvqXxLiMsT+Aao=;
 b=D6+iChnsfyYa9HH9IBcjS+lYpZ88g4bzU42CjfCVH0w9UyP4NQMJ1eGSwT6+s4/PlV
 wZ0LbuXH/KO0bpFjKumxIllxtL0yii2iSPLabdXg7wxk2QdwuFhMybeEsFS5LwIouEPj
 RKbWfFz2Pk2qP4gdDAJYfQUmFjJehbhZZj5obIAhIQZN8RF24wBw3hbsca0faxAZ5CzF
 By6/5bjE7RltN54xlvmksctONC8cD3HHanJW1+pd9YB5sjz7zQP+IadO5DFOKgbX0g0n
 SYDSYTQ5utp8SYUN5WumuHZ6s47m5SaeKF322JbsF/yRJIvkgJf/RJLkmR+llVIu46l7
 lUaA==
X-Gm-Message-State: AO0yUKUjbF/BFdXGrqgm89kpw26LHytt+gAFmhIr2TCyLiW08fTuefP7
 HMsAu/D4gzu76CwxVJSNufugKRuuqLDhAvFT1Iz70NX6MsxyDPDcyzNRdl/kobzIlpvum8XsTtt
 2H9innaHp9xb8gt/0cXaTOS6MIcYYWg0=
X-Received: by 2002:a17:902:ec90:b0:19a:7164:ebd3 with SMTP id
 x16-20020a170902ec9000b0019a7164ebd3mr339163plg.6.1676942792638; 
 Mon, 20 Feb 2023 17:26:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/Sfp7X2+oD5CUIMUVCjxY7+2crEMh8WrKK30BiWKnYG9KRWaL3CmzBbmj4s32P+e6Q0bvXHqVxce7pLOCxwyo=
X-Received: by 2002:a17:902:ec90:b0:19a:7164:ebd3 with SMTP id
 x16-20020a170902ec9000b0019a7164ebd3mr339159plg.6.1676942792356; Mon, 20 Feb
 2023 17:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20230215000011.1725012-1-jsnow@redhat.com>
 <878rgz82v9.fsf@pond.sub.org>
In-Reply-To: <878rgz82v9.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 20 Feb 2023 20:26:21 -0500
Message-ID: <CAFn=p-ZAnqRr7SYVO8n_DaFDUavFykNYwaQy4fCWubTx686kJg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] qapi: static typing conversion, pt5c
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Wed, Feb 15, 2023 at 8:39 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> I had a few suggestions, but none of them requires a respin.  Let's
> discuss them, and then I merge.

Hiya, I lost track of things a little due to the other Python
discussion. Who is waiting for whom?

--js


