Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836E26EFAC7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:13:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkZW-0006IJ-Ih; Wed, 26 Apr 2023 15:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prkZT-0006I9-H8
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prkZS-0003Y4-85
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682536373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eyh7QuwkVFocj4DtMJVD9Q11PqlezQgCBkmNRFA1z5I=;
 b=aKQHmNJ5ID7wfTIMqF5hYSZBwfxw4NdArGEY2AbIgh0y9GiGxJLx2/hZ2+/ZyZqEHwhH6U
 WmUt6oz7EOpn9hoHXQNkhcMHMJxx3NBJkzfxWrb+VLHwtnrPSbeu0vJloIxDTOO4hvJ65I
 wtK2h6gzk/sTpudxqZvrI1Ku2RKATd8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-23-4KNVyMW66ZMRAADBCkw-1; Wed, 26 Apr 2023 15:12:51 -0400
X-MC-Unique: 23-4KNVyMW66ZMRAADBCkw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-74e0dd4e504so40805085a.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 12:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682536371; x=1685128371;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eyh7QuwkVFocj4DtMJVD9Q11PqlezQgCBkmNRFA1z5I=;
 b=iDHlmgga8r7YzsWhIHVogqvNCq9vhHznzvQXMHS7EvI+KIgpKLk/GuDKVz4qjGCvQg
 LzFIzq+znAEIccSom9ZrWstxho/PpWEYhmalC9G5kPnVdUFl/gMXIy64FmdghY5PXhqh
 st27X53NdJHDTCruEPYwYadJBUIOPy4PTBOsAM9EbhTbPO1WYa43+8S7aefbKV4pBg/z
 SrNXhKNTvajgXiLYpwQ08uqQ6Twh/kdRxRRzyjuRGMIjcMdWkPpCh2Wf4r1mFXgrUksR
 GtiiM0F4gL5qxs0d/dvmxfGRrbmZt2sNXKW1vd/LiuZOjMLQ3WMYSAiLDTLwgbKNCt+O
 rgWw==
X-Gm-Message-State: AAQBX9dtsDP/xhMf04uel4BLo/jF2oALDuu5TFA/qfrpYqx2Lt34nXGi
 M7+LpXzzWZg2aSRhj6UHLVc30PLzilQx4j/sPcluQDkwOFFuUSmqh0bixtKlyzXE2Prj+t7Ry6A
 +FYkdwUe2kSS5onc=
X-Received: by 2002:a05:6214:400a:b0:5ef:4436:b92e with SMTP id
 kd10-20020a056214400a00b005ef4436b92emr32153254qvb.5.1682536371328; 
 Wed, 26 Apr 2023 12:12:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350YUPq4wN91PXtDG6N7ngSX5wAEP7kvwfOpoyuAjFItez7fyh5qZn0r77qaJPPpZdur3Ovnmqw==
X-Received: by 2002:a05:6214:400a:b0:5ef:4436:b92e with SMTP id
 kd10-20020a056214400a00b005ef4436b92emr32153235qvb.5.1682536371096; 
 Wed, 26 Apr 2023 12:12:51 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 o20-20020a0cf4d4000000b005f66296da7bsm5080991qvm.94.2023.04.26.12.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 12:12:50 -0700 (PDT)
Date: Wed, 26 Apr 2023 15:12:49 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,
	Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH 0/2] vmstate-static-checker: Fix VMS_ARRAY comparisons
Message-ID: <ZEl3sWSJBprzNlX4@x1n>
References: <20230425180544.1815888-1-peterx@redhat.com>
 <87354mfvnz.fsf@secure.mitica> <ZElvWffplx+1vNH1@x1n>
 <87mt2ueaph.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87mt2ueaph.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 26, 2023 at 08:54:02PM +0200, Juan Quintela wrote:
> This is why I mean that I want the "diff" to be a bit more intelligent
> and "record" the things that we tell them that are correct.

I think I see what you meant. :)

> I will start with the default machine devices.
> Once the mechanism is done, we can wonder with more configurations.
> 
> I will start small and then go from there.

Sounds good!

-- 
Peter Xu


