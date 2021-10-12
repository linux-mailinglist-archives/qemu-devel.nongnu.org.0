Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232AD42A3B8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:59:23 +0200 (CEST)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGRG-0004yu-5q
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maGNJ-0000rT-0A
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:55:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maGNG-0006Ps-Po
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634039714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfXdHsvdmDJhf6egLeOKia9eAAIvNbu5RbgsTFb+qP0=;
 b=DKfvoWTGSrm9Q++/8wO8w1w4DrD0MtuN6p68RTAjnrUSJzcBaSuitcnQrMc5CndJwrDOle
 58osUtqd7BmhfESHrxWNdvXKjCgWO7dhyfnPCjnivbPOx0qmcPQbaKllYSQNfoP1Bx2+O7
 heT2exeJeBitETOFwuyqd5ZxmECz1wg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-G6J14w6BNGuf1VzV9srrQQ-1; Tue, 12 Oct 2021 07:55:10 -0400
X-MC-Unique: G6J14w6BNGuf1VzV9srrQQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so4431384edv.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BfXdHsvdmDJhf6egLeOKia9eAAIvNbu5RbgsTFb+qP0=;
 b=oKKleFBP7skrX2i8ciZYv8uTme+eqSNN7U66leYFcIM+ORm/6VmS7Dt6TABioKyPFL
 4Yob2Nb4NUgYoLevdN8U0oktNjWlGHC1QNYdSaG6ohBgLBSq7rPdoF126CKCduLM7C0C
 VoZe4LXI5Agt+EEmJoPACeM63iZzAoBsrvEhGw8nx2DOON1umOaBBMTNg3nfCW0nb95V
 1qX4E/Y6092/+OzVSYIPGbW7FdhkuBnIinwewNBOKVMwGMs0aUqDPdTr0zQuwshnax6Z
 FAfZEwlrweiFm7sfUlXhK9fBIMsIRNIYre5D17U0STh5useLTFf1FZJKcleFWRNLF+nX
 PRuQ==
X-Gm-Message-State: AOAM531XDTMTyl0V4NX3vNeo6lJhwsL3StEZSxvajg+obtKrtS5+wacN
 fanfm/dJIx0ZdQfvPithYDA0LEY0a4yVzxDqVr+hrLfPOeKd9WKcFi1Opw/cOqGGJYM9YCllAwa
 Sxak/rzoWx9didbz9TcSsarRetkF9fsYN1EEqbHDjvEgOtrXHGM8AFDsArto0wqs=
X-Received: by 2002:a17:907:1741:: with SMTP id
 lf1mr24342260ejc.225.1634039709669; 
 Tue, 12 Oct 2021 04:55:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBcr4hcPl2MuQshZiZGio3dgal1YlBHy2/tXvg9awx/nQ5LX/cYw7NTGRC94wVsjUFVO7bfw==
X-Received: by 2002:a17:907:1741:: with SMTP id
 lf1mr24342237ejc.225.1634039709440; 
 Tue, 12 Oct 2021 04:55:09 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id v13sm5896187ede.79.2021.10.12.04.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 04:55:09 -0700 (PDT)
To: Kevin Wolf <kwolf@redhat.com>
References: <20210329072559.2668780-1-thuth@redhat.com>
 <YKTu+SHgCDiPCinD@merkur.fritz.box>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] block/vpc: Support probing of fixed-size VHD images
Message-ID: <9bd41658-6fa9-e9f9-4999-642dd3957ea7@redhat.com>
Date: Tue, 12 Oct 2021 13:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YKTu+SHgCDiPCinD@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/2021 12.56, Kevin Wolf wrote:
[...]
> We have a bug in vpc_open(), though: It sets the local variable
> disk_type correctly, but other functions use s->footer.type instead and
> we never check that it actually matches the disk type we think we're
> opening.
> 
> So I think we need to add this check (and we need to add it even if we
> don't change probing), and then the change to vpc_probe() is probably
> okay.

Right, that looks like a potential problem. I now finally sent a patch here:

https://patchew.org/QEMU/20211012082702.792259-1-thuth@redhat.com/

  Thomas


