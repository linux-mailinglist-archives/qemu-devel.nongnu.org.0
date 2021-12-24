Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C109847ECA2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:20:47 +0100 (CET)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0esf-0004jJ-Pc
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:20:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0el9-0002CG-Dx
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 02:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0el6-0003fP-4G
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 02:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640329974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6VzuhmYI2t4F7RUVA7iRpnTIINLfWZX3Q/dRio+4Ec=;
 b=W+Gdp9P36v5uU5b7j1jizBT5w3wMaKud+bYPbtqC6G+ay+SEW8DWCkM0r63fazS9P59ger
 22AqkAGkP74hR+zajrgqQNhLTqLcsFFiVcRENyys1QFAHjxMHS9/tLy0thiW4AlbspNvAS
 jDbS1gJTTuTaJ98uH9fT0n/gExcMV08=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-Vgt9JQq7PvOjoSR-6i7F7A-1; Fri, 24 Dec 2021 02:12:54 -0500
X-MC-Unique: Vgt9JQq7PvOjoSR-6i7F7A-1
Received: by mail-wr1-f70.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso1476866wra.18
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 23:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=P6VzuhmYI2t4F7RUVA7iRpnTIINLfWZX3Q/dRio+4Ec=;
 b=X5TdoN1k0LZsXM2ZCb4hCagVE33hzwnHpMn+VsD/f2GCu1Lc3vIoGYmUff7V+OM6t7
 T1zgDf/AeSm4F/ceGZEtPdFy2yDbLObHMR9Q1VmogrvS6oWEax9rqwtykmxQJYLJNYt1
 nNOi4l2dTRbQ24eOoF2gT2GHQLehnTKe6cMmpRNe9DHzjPDM6dpCKZuz6n4N502hLUMb
 ay0JaYF5U1+qY4pMrsPgiu9ZBOZn3vXK7ExzthrJqqXY9z5pde4oxGhLjmueE3OPTL+P
 QBBZVz2/aumo/NBO/KOMtWAXsX/4JQCnYmaJYrJAA+5RaugmdRGIWhXOBqq4DeXa2K6y
 6m6A==
X-Gm-Message-State: AOAM533WGu/OlxfyW0AyzEEZ3UdRCTqWSPT1SbPzq3wFBJobhXqfOY7t
 6TFwW/vAyAx0UWlkwru3ivuciKdp7eA0SBvSeeYOnKnMFLQhN1bWm2wOiQndKRf0YXDCl2vA8ZY
 9VuYBx0ENBj5vZBo=
X-Received: by 2002:a05:600c:4e4f:: with SMTP id
 e15mr3978119wmq.67.1640329972604; 
 Thu, 23 Dec 2021 23:12:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNdOJjkBYUM8R4P/aB1hqVGj9EI6MPeMLyceNlaQk3efpyzAu01jeNmfbp1ghxFmXex/P6CQ==
X-Received: by 2002:a05:600c:4e4f:: with SMTP id
 e15mr3978107wmq.67.1640329972418; 
 Thu, 23 Dec 2021 23:12:52 -0800 (PST)
Received: from xz-m1.local ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id ay29sm9145547wmb.13.2021.12.23.23.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 23:12:52 -0800 (PST)
Date: Fri, 24 Dec 2021 15:12:46 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 1/6] migration: All this fields are unsigned
Message-ID: <YcVy7mu1GVyLvV/n@xz-m1.local>
References: <20211221125235.67414-1-quintela@redhat.com>
 <20211221125235.67414-2-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211221125235.67414-2-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 01:52:30PM +0100, Juan Quintela wrote:
> So printing it as %d is wrong.  Notice that for the channel id, that
> is an uint8_t, but I changed it anyways for consistency.

Just curious: uint_8 can always correctly converted to a int, so the patch
shouldn't have a functional change, right?

> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


