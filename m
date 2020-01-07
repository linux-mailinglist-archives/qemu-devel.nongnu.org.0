Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0981326AF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 13:48:57 +0100 (CET)
Received: from localhost ([::1]:48034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iooI3-0003GI-LI
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 07:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iontN-0002av-SG
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:23:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iontM-0007jD-Nd
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:23:25 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60282
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iontM-0007iq-KR
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578399804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXXcd9I4Oe8zUZ/TUG2fVRYwVh3+Fz+kghGLprcBOvY=;
 b=Tg/PtaHDIYT6qd1Im/LPInek5wo8Ox65cew0f5plj6rx8a3EeKeYSnBJaFQxlex9chJJ8+
 Hsd/dA+0GPhqHUH9elO6bZiEmUUArPPwnRNdUKrw9VDBZVF7sBfCbsGH2tH7UYaYQ4xxNa
 EkRIYd3MN9DDfNagkpI2aFJcruDb1O8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-oBnXVCRRNzWwU69HLpNjAA-1; Tue, 07 Jan 2020 07:23:21 -0500
Received: by mail-wm1-f70.google.com with SMTP id t4so4031567wmf.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 04:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rXXcd9I4Oe8zUZ/TUG2fVRYwVh3+Fz+kghGLprcBOvY=;
 b=cRG/OuqqTRJRCFnHuFMFDN14k70C/v8aIwxKX2VZfdysskQL9g11rgFFme0enBI0WG
 2bQ2AtJuWYOGdTBRkH/aCmOOpr55ALkrM5iFa+3f4SVzldm6wJUhpbf9GL/Tl801Xdyd
 PrBgIbrqB2eujflfIB98B+2H/xG407BruhnndgmwiR6MQ+sDNFLAlVc5PbzkUSMwB9xi
 h9AWvLafhZB5JdK+w/37SSun40MNqb2E8qdC459ex/AzVA/lrlqDhNbgT4MjRdzhfA3v
 i6UFq0gv/f46wznj7r4LQWyHLQj6BkQlIGbGFtlHJNZ74SiAhaVeX1ExKUsgLjuHrR07
 lgvg==
X-Gm-Message-State: APjAAAV/dVaI+LJw1uHz0lUhoBJKl5BaiC5zZKwMPLpyVqnBLd88/MST
 hv0gfk1sNrSnOesPArGChIgPaCNQL7scex16SNQBP8ETGIu85YhV/L5qWPwh5eOtd3AMwo+eX/u
 G9cZMhw7qW56/q2c=
X-Received: by 2002:adf:ea05:: with SMTP id q5mr110244556wrm.48.1578399800012; 
 Tue, 07 Jan 2020 04:23:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqxj4OtaV5nj3AGR3WIS+N1NzU8q7M8r3vlYsZiAYQQbGEIZt/wqTpg/LOcuKfTA1uyctTANwQ==
X-Received: by 2002:adf:ea05:: with SMTP id q5mr110244522wrm.48.1578399799726; 
 Tue, 07 Jan 2020 04:23:19 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c6d:4079:b74c:e329?
 ([2001:b07:6468:f312:c6d:4079:b74c:e329])
 by smtp.gmail.com with ESMTPSA id z4sm26649098wma.2.2020.01.07.04.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 04:23:19 -0800 (PST)
Subject: Re: Priority of -accel (was: [PATCH] tests/qemu-iotests: Update tests
 to recent desugarized -accel option)
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20200106130951.29873-1-philmd@redhat.com>
 <c493e693-13a7-7dc4-eb2d-5dbc7b3053f1@redhat.com>
 <12334054-4ae7-e580-9727-2d322bfa2bda@redhat.com>
 <58eb34db-7d32-8b0e-d9ef-98648209486b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <656169fc-1abe-b521-20a3-e7041739b914@redhat.com>
Date: Tue, 7 Jan 2020 13:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <58eb34db-7d32-8b0e-d9ef-98648209486b@redhat.com>
Content-Language: en-US
X-MC-Unique: oBnXVCRRNzWwU69HLpNjAA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/20 13:18, Thomas Huth wrote:
> I don't think we need a separate priority parameter here. But IMHO it's
>  really rather common practice to prioritize the last option. So while
> it might be more "self-explanatory" to a CLI newbie if the first
> occurrence got the highest priority, it might be rather confusing
> instead for a CLI veteran...?

Prioritising the last certainly makes sense for a choose-one-only
option, but I'm not sure it's the same for a choose-best option.  After
all it was -machine accel=kvm:tcg, not -machine accel=tcg:kvm...

Paolo

> What do others on the list here think about this?


