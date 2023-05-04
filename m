Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754DC6F7130
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:38:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoG-0006so-4Y; Thu, 04 May 2023 13:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puZvv-0005kZ-BH
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:27:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puZvq-0004f1-RI
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683210461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n1KnbsECs0MVFgN72HBootyvPzF4pVoYHdcXGTBSkcs=;
 b=FhIH6glTlM3SppfA7eTt4XFzewLuJIshmuE6OjL/uNGwJXPmLYBp/nokfoC7m0fg4Dy+tE
 6Q4JCSNPgs8c6Vv3KUf6uO4vJQnwIGT9ymNe3XIoJTig/iPet0YCORj91PFD/ickIpTuxa
 Y1mvncvsFLUHwL1QcyRwFiIPmwsjcJA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-Mac2pIpNMgmCLKwoN2pBGQ-1; Thu, 04 May 2023 10:27:40 -0400
X-MC-Unique: Mac2pIpNMgmCLKwoN2pBGQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ea572ef499so173406d6.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683210459; x=1685802459;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1KnbsECs0MVFgN72HBootyvPzF4pVoYHdcXGTBSkcs=;
 b=FNXhi+cpICHcIs+xNcsV4DHv8tcqy0gGgi2EyqJrab3gB+7rLkMzvKO/TinieNh/Nl
 HQ4MrKg6v8yoboVEs6uxDucTwQNpMpMCCLh7CtLKXEM1aJrzcxwMXLlf+YXoF5gZXt6p
 GKtQu36ahBi9+nNBse386ZGvtLGPA8e10IehPRcQZrSR2zJ3NbLEdfsLN6bt+7/WriBR
 ksLbo6NWCQ5c0uEILvr+Uj69/4wzDtwRC084mz+f80FKICgmus/5kl7AiWIPaHzCiItd
 zYY3tu3XBv3NpnMWSEWp3xsQApocv8hlowHrgcZxX1eaqSoI8jJVzrEyYWK95qtTp057
 GVpQ==
X-Gm-Message-State: AC+VfDxTkOvjsMGXp7j0kMSo3zK9CHzloAJilBEtUmaN+GEpJEpkE6+v
 dtDtkkGDwFEfhNiGh+UmqvR7U1KEv6Uf9BlIGFayDrqulOIaGpoP3m7T9xA+ugZMxoBNoU/HGEH
 WIjTKyad5lSeGdL4=
X-Received: by 2002:a05:6214:3009:b0:61b:76dd:b643 with SMTP id
 ke9-20020a056214300900b0061b76ddb643mr7151948qvb.4.1683210459710; 
 Thu, 04 May 2023 07:27:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6r6wgN3Mm5MP04y0jh7/x9IikdnumyFUNPbnXKeNQAEdCjnN1WbfN8F4q+Zp8UnTSYk6OX4A==
X-Received: by 2002:a05:6214:3009:b0:61b:76dd:b643 with SMTP id
 ke9-20020a056214300900b0061b76ddb643mr7151907qvb.4.1683210459438; 
 Thu, 04 May 2023 07:27:39 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 f2-20020ad45582000000b005fdbcab3065sm11215925qvx.72.2023.05.04.07.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 07:27:38 -0700 (PDT)
Date: Thu, 4 May 2023 10:27:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 6/9] qemu-file: remove shutdown member
Message-ID: <ZFPA2Z7p9OZ7EroA@x1n>
References: <20230504113841.23130-1-quintela@redhat.com>
 <20230504113841.23130-7-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230504113841.23130-7-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On Thu, May 04, 2023 at 01:38:38PM +0200, Juan Quintela wrote:
> The first thing that we do after setting the shutdown value is set the
> error as -EIO if there is not a previous error.
> 
> So this value is reduntant.  Just remove it and use
> qemu_file_get_error() in the places that it was tested.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Nit: I'd squash this with previous.

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


