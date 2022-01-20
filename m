Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E32494FCB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:05:43 +0100 (CET)
Received: from localhost ([::1]:44416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAY4M-0001Cg-2D
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:05:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAVOL-000375-4t
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:14:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAVOI-0003Fk-52
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642677245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=okFmfeEz5l0QwH53KXJfvGRX+hOuRs6D18mu5hQhgjI=;
 b=EiZYro5n5gBGCFh6Ep2C67AB3IrVnxY6aNG1IIBA/1c6OUn3wfIt0Qnij8MkbJsrATBQ6d
 BvudYewyd7A2xQmCX7wtVU7NfbLfT5d+l5nTxl+nt8tNunO45v/HsLaPjw5F4pZTenFzd2
 0a5riUqgJM3rDx4VovFaA5PN7Njvrzo=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-8yrz2AohM4qGFZAClxyGAg-1; Thu, 20 Jan 2022 06:14:04 -0500
X-MC-Unique: 8yrz2AohM4qGFZAClxyGAg-1
Received: by mail-pf1-f198.google.com with SMTP id
 v6-20020aa799c6000000b004bd635ff848so3622450pfi.6
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 03:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=okFmfeEz5l0QwH53KXJfvGRX+hOuRs6D18mu5hQhgjI=;
 b=lkp/OUZIyzPbXd5hM8ZkRtH4Bj6WFpTdQOqJfh5dtwV8Kldo4HglhQEMXEj11cy8tA
 xalA8ecMmoxA/2NkWFLO7F/Y2Yz8IOVpst9pV0pUrohtEGPTg0c/9ubSlEOaDhjFuc7U
 V8NnHLYF0kGAVvNhfGXDXHE8g912AoVvfPO3OdRY+Rcs+Mwp0sJWeDfQDRa7VD3Rvs2q
 58kdWjzqJ31+e8txfQ1fDSWUMeBNpCGiuCQSDpKyl93zbRXjlg2Lh6WSFNmjR08PJ12q
 n2QPRXQskfhjhdic19ChaZSK34iBmqzjr+xkMc5ZNiJ+h12W7ud0S93aYhuSFDh3drrU
 jJ0Q==
X-Gm-Message-State: AOAM532N0o84vDHqZlo3jYwOEjHJZcoV17ouvFYhoOFgQtc0n86D47H1
 tOvULAIfHXCWvViIMasxNaUWDMNDT0FjCCacfmrF5l6Ys039MEKkqWcz8NCBZ7lUyLeP2rt1DyA
 ER5I5WFK/3f55sP8=
X-Received: by 2002:a63:7c48:: with SMTP id l8mr30821400pgn.483.1642677243457; 
 Thu, 20 Jan 2022 03:14:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxe7Pt8kwt6AUhea9r/03PQmC5PpNNG6/ras7Ga+hBlddU89KHdCaH3vqXKA2vgswawPM7pJw==
X-Received: by 2002:a63:7c48:: with SMTP id l8mr30821373pgn.483.1642677243205; 
 Thu, 20 Jan 2022 03:14:03 -0800 (PST)
Received: from xz-m1.local ([94.177.118.145])
 by smtp.gmail.com with ESMTPSA id nk11sm2155032pjb.55.2022.01.20.03.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:14:02 -0800 (PST)
Date: Thu, 20 Jan 2022 19:13:55 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
Message-ID: <YelD88RHRjLURES9@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
 <d34dbb85-f8a9-cb21-a312-a4f4f3cafd07@chinatelecom.cn>
 <Yekqn90HOtFMWupM@xz-m1.local>
 <c6086788-da45-d023-edaa-5fca9a602c5a@chinatelecom.cn>
 <Yek/2BoqmYBM0PWt@xz-m1.local>
 <a4d34697-d187-a8cd-e244-b6fc717db9cb@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <a4d34697-d187-a8cd-e244-b6fc717db9cb@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 07:03:30PM +0800, Hyman Huang wrote:
> Ok, i'll try this out.

You could even add a unit test if you want: see test_migrate_auto_converge() in
migration-test.c.

-- 
Peter Xu


