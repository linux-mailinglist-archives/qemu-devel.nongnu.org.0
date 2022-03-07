Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890E54CF29A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:31:31 +0100 (CET)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7q6-00071e-LF
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:31:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7hB-0007SF-U6
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:22:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7h9-0003rT-7N
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646637733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TwREdLRSqzgiaXWOI9CPeaghlb2ednyEidy47GjyreQ=;
 b=NlgDxIW9vqoPUiK3Tm+tN7CdOnDr97ZedBMa3Y1cYlNUTeAKxlWa0ANBB8GUr5GiLSzr0R
 sdLr7Ei+wY4VeSOQVqGuktjR24U4IPxivJveS9EyATywNksVNGzvCGLuZ4s0is8UGJqx/f
 IWm3zMcpqCT3eeywsjIJ4lmkYkFfPqU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-Dxg9LOU_PrawmtJ_HNFmrg-1; Mon, 07 Mar 2022 02:22:10 -0500
X-MC-Unique: Dxg9LOU_PrawmtJ_HNFmrg-1
Received: by mail-pf1-f199.google.com with SMTP id
 m22-20020a628c16000000b004f6f1b43114so2372967pfd.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TwREdLRSqzgiaXWOI9CPeaghlb2ednyEidy47GjyreQ=;
 b=gb4iRRK2lfnNu1rTSuNFD4SqG5chFCJahnHMX0UNr3VLyUcSC8jesDhoXzc1RGScDW
 PmiFxct+dd+ztgVQ/qnLn3YV5t3eOA9jes83+vVbi1glC9T+ris1sB3nKGPpl9PbH7Jh
 hvF95u+5xpJBvq5nzkDtaWJ7o4MhyXth7MTHfpZtxeaOuWUPyd2zloLC9xZSrsMfnWBA
 IupnOxPEwMQgKQQC55sdPaQxFU69s5R7uyGspy8RiOdLF5DaRd4HIC/f/Y0HnBl/OI8n
 mO030k6K7yKv418COnqwi/3jk+vaW/z86EhscMCyavc8vSZ9+kkncSbnT+qpUvfdA6b9
 FdIg==
X-Gm-Message-State: AOAM532fXN7VZTZ9u9V/FJB6R1U8bdZTD4dftUOzKuqL2P+pxQ1Twn3w
 iEWhTW30rlpXGVyj0iGtZlB+8m2FU62KAh65FwJOayBCq4YwgeuE38TzRa1tGZWUEgzqB1PO/wf
 d2sDP17e3bu4fYO4=
X-Received: by 2002:a63:2a53:0:b0:372:cb6d:3d61 with SMTP id
 q80-20020a632a53000000b00372cb6d3d61mr8779135pgq.575.1646637729040; 
 Sun, 06 Mar 2022 23:22:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylmuIoTTFJ7eOb7blnxf8ONSr1dggdWBtAwwl7uCPT1OiZhYUwBL/ib9gvpSzBQMaagw791A==
X-Received: by 2002:a63:2a53:0:b0:372:cb6d:3d61 with SMTP id
 q80-20020a632a53000000b00372cb6d3d61mr8779124pgq.575.1646637728776; 
 Sun, 06 Mar 2022 23:22:08 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm15565772pfw.188.2022.03.06.23.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 23:22:08 -0800 (PST)
Date: Mon, 7 Mar 2022 15:22:03 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 10/18] tests: switch migration FD passing test to use
 common precopy helper
Message-ID: <YiWymz8TmooldMF+@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-11-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-11-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 05:49:24PM +0000, Daniel P. Berrangé wrote:
> The combination of the start and finish hooks allow the FD passing
> code to use the precopy helper
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


