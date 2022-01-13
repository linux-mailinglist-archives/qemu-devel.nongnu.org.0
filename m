Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F7748D01C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 02:24:45 +0100 (CET)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7or5-0003yx-Kb
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 20:24:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7ooO-0002XF-In
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 20:21:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7ooL-00054s-4E
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 20:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642036912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4tJ/15u0awnPMChAapGAhea+PEYZzn2moRXbM0LFphk=;
 b=TWDTFkKLQbW46teytoEspOkX2LZ+ziHWAK0qBkWU/X1yRN+aGpo8RvoiQim+9k/ou8oMyL
 qAQzU9BxLqzoxgqOPqC2DyCLwn9wqUApxFguKqEGL4D2/bA6zdm7WEHnfexIz15DBnhf8h
 gjbjDuVKPfiPbqYr9+zNg+sJV/O2AuM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-pVhw9OI_Oti04wGbUW9cxw-1; Wed, 12 Jan 2022 20:21:50 -0500
X-MC-Unique: pVhw9OI_Oti04wGbUW9cxw-1
Received: by mail-pl1-f197.google.com with SMTP id
 e10-20020a17090301ca00b001491f26bcd4so4313160plh.23
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 17:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4tJ/15u0awnPMChAapGAhea+PEYZzn2moRXbM0LFphk=;
 b=fDWgOQO0zx0N+0xpAmSvtqyCyM+jf3bKYqsWBdO6P5qDcLfoi4d3L7nvAGF5rbd2Ki
 ZzKuT5KCcagxl2lSZiTK0QNWz+jyn09K7xZ2s/ZZ5flCXjLBvc8AN3AYFvoH/sYibPRS
 wMo6u/9CEBCLz9RgEPWW6jn7KxUDfCLRk2A+YwwPfCPOmHne9pDtdA17ilMEa+jiWzj9
 Ni8Us+3w8LVOvMgfW6NFcBPxJtUCtvrFo+NUycfn/L+epW4hmrjvKijiLgv1+U4HEvNL
 DvWBwSh4+ZpSKOAP9eGdQACC8nyah9Wt5/0Ne3dfMKlpkupxoOvVvV6TDWcv8ZWsn7WQ
 wl5Q==
X-Gm-Message-State: AOAM530L6hX/Xb3K/paamQEIdsIRcuVh+BrtKgCyNIreVbLJYDcf+X67
 iLOAdFAPUUXJ/zNHFxYl1RAZUdGnFse9Bii6x7vTRTYwoKdMXJhQFG7CIbqomdL7InZiR0SHxg4
 ExGaMG5xB+u5g17E=
X-Received: by 2002:a17:903:41c8:b0:14a:66f2:b16e with SMTP id
 u8-20020a17090341c800b0014a66f2b16emr2089523ple.98.1642036909655; 
 Wed, 12 Jan 2022 17:21:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy048xj/2noRQ4UHVlTIjj7I+k00lFZt2gAA1Fr3LTuzZdUh90z2nZ7YH6f+cJCQLSh5GIk6w==
X-Received: by 2002:a17:903:41c8:b0:14a:66f2:b16e with SMTP id
 u8-20020a17090341c800b0014a66f2b16emr2089505ple.98.1642036909394; 
 Wed, 12 Jan 2022 17:21:49 -0800 (PST)
Received: from xz-m1.local ([191.101.132.87])
 by smtp.gmail.com with ESMTPSA id b19sm775929pfv.82.2022.01.12.17.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 17:21:48 -0800 (PST)
Date: Thu, 13 Jan 2022 09:21:43 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] migration: Add canary to VMSTATE_END_OF_LIST
Message-ID: <Yd9+mPj6tldj3uwo@xz-m1.local>
References: <20220112102345.79395-1-dgilbert@redhat.com>
 <CAFEAcA9b9NtkyWY2aCUpOvm2J5uRVt9qUPj6gPk3MFtkTh6ceQ@mail.gmail.com>
 <Yd6wrYdzzT/XsSSK@work-vm>
 <CAFEAcA_W9KoMiuBApJaPs9inOrWtjzr2F4L4qnnTxegvFwd_NA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_W9KoMiuBApJaPs9inOrWtjzr2F4L4qnnTxegvFwd_NA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: quintela@redhat.com, marcandre.lureau@gmail.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, lsoaresp@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 10:56:07AM +0000, Peter Maydell wrote:
> We could have vmstate_register_with_alias_id() iterate through
> and assert presence of the right terminator (probably only if
> qtest enabled, or some other suitable condition). Then the
> existing tests that do the basic "check we can instantiate every
> device and initialize every board model" would run that code
> and catch most missing terminator cases, I think.

Agreed.  How about assert it even without qtest?  We do tons of assertion for
programming errors anyway in QEMU.

Thanks,

-- 
Peter Xu


