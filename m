Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30E330C4D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:28:29 +0100 (CET)
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJE3o-0005Cl-7F
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJE2n-0004mK-AF
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:27:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJE2l-0006iQ-QF
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615202842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcvDMbn2pBZetOs5brV6ly4Q+IonTK+35A1e6MnXDiA=;
 b=SgGWT82Cndvula2nrm6djZciQIc/Fnu/GMFajWgIv8iecokuIqZgwACZYVabmPEjLW3VXt
 UJljncphV/mgspDEJcyP9yKmfKUrCtxRFDgtcFOGO3tDXlXkR+kZvyU6M0/c54pmgp+n62
 ufp9dJGXNiYhiRl5IByeHwHfuuP8Iko=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-Ze8Qk3qgNIKhoJUuFD2lVQ-1; Mon, 08 Mar 2021 06:27:21 -0500
X-MC-Unique: Ze8Qk3qgNIKhoJUuFD2lVQ-1
Received: by mail-ej1-f70.google.com with SMTP id fy8so3925347ejb.19
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OcvDMbn2pBZetOs5brV6ly4Q+IonTK+35A1e6MnXDiA=;
 b=VD23cTsN0m2gWLkpQyIVarDMYI1NbRtcZMI7y0repzG51nPO7tDjTqwRooevxeeug4
 HO2gDgxOZ3mpfVd/lnRg+G3xQ+But3gkOaOBE6oYECtp2kWWOu6tmVsjCPUsu3nICimE
 nfNJO6K13rTpXC6fA3AKVZj5fGTGwDxt0ik7UBNJcEb0uOa+ttPWkeOta8BC7d/XbgVP
 J0M/W4XLuIRq8kOT9uhssqPn7mWqsLQ1VgzrfUdz1CNGObVM/OM0fWMpia3IGzv+/06K
 I+ORtTHgKpJT+4vMOv9f/VezXT1OJcL70ICG5Io6ilAj2rqT3hHydtAK9ibCLQGVDtkl
 /iYg==
X-Gm-Message-State: AOAM531nHywPiQC14Yg1d3wWoqq2grXg2ctawdVPvazr3nFiD2QqfAG7
 lrgmEoGNw622v3iniVMFB2TAec7VPNSaZE3VMQ6iR5saMdzRlpkiDgSoBH1WBo2nUuVMuLPgEd6
 /qAd7XJ+QUwBLmXtAeLBbt15SZpB0A8D80templreOzA3z6oB+Ts0XaMwr8bl88OFfw8=
X-Received: by 2002:a17:906:81c9:: with SMTP id
 e9mr14338270ejx.456.1615202839771; 
 Mon, 08 Mar 2021 03:27:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybpMJMjiu0M33WyropPX3V36u91ND6DDxBzbUVHp7lO46/nRRG7KDpNMacxaLxIh2/QMM5zg==
X-Received: by 2002:a17:906:81c9:: with SMTP id
 e9mr14338252ejx.456.1615202839441; 
 Mon, 08 Mar 2021 03:27:19 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id t15sm6899604edw.84.2021.03.08.03.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 03:27:18 -0800 (PST)
Subject: Re: [PATCH] meson: Stop if cfi is enabled with system slirp
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
References: <20210304025939.9164-1-dbuono@linux.vnet.ibm.com>
 <YEC4Rk/eAStVIFU7@redhat.com>
 <771f3a7b-f42d-fbd9-5bdc-bce5d354278a@linux.vnet.ibm.com>
 <YEYISUuI49rphmDe@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3f962547-d3ab-3fb6-0b05-f760963d42bb@redhat.com>
Date: Mon, 8 Mar 2021 12:27:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEYISUuI49rphmDe@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/21 12:19, Daniel P. Berrangé wrote:
> My concern is that libslirp is just showing us one known example of
> the problem. QEMU links to many more external libraries, which might
> exhibit similar issues.

We know exactly the issue: QEMU uses a pointer to a library function as 
a function pointer that is called *from QEMU* and not from another library.

More issues like this (or other CFI issues such as the GLib casted event 
handlers) could arise if some but not all the dependencies are linked 
with CFI.  But that should be handled at the distro level; if none of 
the dependencies use CFI, CFI incompatibility issues are fairly limited.

Paolo

> If we need to rebuild all the dependancies
> with CFI too, to be confident that the combined work will operate
> correctly, then this is quite a significant implication. Overall I
> think this is going to be a problem for the changes of distros adopting
> the use of CFI, especially if they're not using CLang as their toolchain.


