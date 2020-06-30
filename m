Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40FE20F8BB
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 17:44:18 +0200 (CEST)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqIQj-0002Vm-R1
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 11:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jqINW-0007zq-Ee
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 11:40:58 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48541
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jqINU-0003pG-R9
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 11:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593531655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aF/Dg1AjV/NnA80KCOKuIhtcbq/hBmfaVpwEHsrsODk=;
 b=MZyru60yKlyik+ejuxsLi4SF8iV5O5fbdmGZ+h1bnmsIx/HoNxyeey/1GAP0qxrrpa0d7l
 UeLT+DqexaAXl/+3HYrsJy6YZIAzBqTVHIVBGIREKjEYuIxTChzqvoJ7kQQmYAUFkNVYXk
 80Nc8Zl7yINIczSM16o8ViZCpSLW38k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-8Q2Of9O-MzOTF_hiLuIX1w-1; Tue, 30 Jun 2020 11:40:51 -0400
X-MC-Unique: 8Q2Of9O-MzOTF_hiLuIX1w-1
Received: by mail-wm1-f70.google.com with SMTP id y204so10051878wmd.2
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 08:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aF/Dg1AjV/NnA80KCOKuIhtcbq/hBmfaVpwEHsrsODk=;
 b=CImQWit1jlQ1bxOj2mlYScm+02TGt25g4VN/EfmX7COmCvJvodXPzZmkvD0pzgZHJT
 2mL1jQEEnazxD1u+SUDEk+IQj8ZdsZYsTpuv81DMmNgebUj54ed/TZ2ohYgCc67WDfB4
 BrtnNs7EaXAN1LDI2pm3jW0UCDQwm3uNi/+bY8qyRR5Ul5iMBjuw4FM27GeLTLYHNx3K
 aLsZ2Ga3GxWLhbsyQphM0sD1qa1QqCPGfO7Lfgv6OXD7sfLWJwq4KOZVOKYkKYApUZ2v
 /9ohAc3dRAW9xevhMfFTz0u6c85TlDvFTjZu5D14+8nPaH4KdWymYzPwVA07+hY782qo
 fOYA==
X-Gm-Message-State: AOAM530krp9d6FK6PR4SXO2Acj9WKe4pQ7OlkxpiLsJIB8IaVnIRpU5Z
 +6e7TUb7MnrNXkxd6+7ji9O/JYv6aTcf0xUd4mCMHV9qr4hqvzm+EtZsk17vhoylpT0togbETug
 DLr9AqmmDvVfg0SY=
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr20771249wmi.99.1593531650466; 
 Tue, 30 Jun 2020 08:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYy9DWP4FHoJyz3wKp+sMwRgfqaImVviuvNOuXC021KYkoPuh4PgtYdXRz804l4cDZbj18Sg==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr20771237wmi.99.1593531650231; 
 Tue, 30 Jun 2020 08:40:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:acad:d1d4:42b8:23e4?
 ([2001:b07:6468:f312:acad:d1d4:42b8:23e4])
 by smtp.gmail.com with ESMTPSA id p25sm3781946wmg.39.2020.06.30.08.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 08:40:49 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] scsi-disk: Add support for the GET LBA STATUS 16
 command
To: Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Lin Ma <LMa@suse.com>
References: <AM6PR04MB578290CA80CC6000756C4C0EC5920@AM6PR04MB5782.eurprd04.prod.outlook.com>
 <20200629103948.GF31392@stefanha-x1.localdomain>
 <556bd179-71b5-cbe7-1d8b-eff20e70a7c0@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <36c010ea-5075-5e4f-a7f2-13f145bf83e2@redhat.com>
Date: Tue, 30 Jun 2020 17:40:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <556bd179-71b5-cbe7-1d8b-eff20e70a7c0@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 02:00:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "fam@euphon.net" <fam@euphon.net>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/20 18:02, Eric Blake wrote:
> - allocation implies that data comes from this layer of a backing chain, rather than deferring to a backing image 
> 
> - allocation implies that storage is reserved (that is, not sparse)
> 
> It sounds like we are trying to represent the second question for scsi
> (namely, the same question that gets answered by lseek(SEEK_HOLE) for
> POSIX files), and not the first (namely, the question answered for qcow2
> images).
> 

Yes, SCSI does not know about layers.

Paolo


