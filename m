Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC00321E95
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:57:17 +0100 (CET)
Received: from localhost ([::1]:52660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFSO-0000ha-96
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEFJ4-0000VT-NQ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:47:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEFJ3-0001wS-7I
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614016056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKAGz1WqBNreyORd3FFwmg0K3Nu+BVaiTX6F3ayv94M=;
 b=MLCoO/x37u4c19CFf/E8+7ARWDTSMABC9EZHvhA5jzk+Ivsyfi1yDvKT5DMlFH+Os6zK/v
 H90IrisjM70+PdB72/3CVA3plWpD9PI1RpNRw7sKVM5K6N7BrF2Whjveew2bLVZN3rp0bF
 sFwtrh7T0i+SHU6ESO5MWyL0kV1dCHY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-G0nj4hOtMaik9ueIeGUTzQ-1; Mon, 22 Feb 2021 12:47:32 -0500
X-MC-Unique: G0nj4hOtMaik9ueIeGUTzQ-1
Received: by mail-wr1-f72.google.com with SMTP id j12so786694wrt.9
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kKAGz1WqBNreyORd3FFwmg0K3Nu+BVaiTX6F3ayv94M=;
 b=WAQqdut0y6n/mb1U8HD3Kpdlgr5e8Uq3KuJzTpwD0UkQK4gB/EeGiQTNMIBi346R4/
 N+T8dAYLF0OHSydsy+4bxyK/Iugzan++We/2abdzWU+1l/1ux3Yb377SveQ+b0VwqfpX
 oO+LnYISiIibGSEV/TVX8ZHacqou03fWEtxvUfyq8vJJ94yLrRWW348PKqErFY05KVXQ
 412dZl6FsaVix/ESd+WcFvWJNWc++ElxhqbxqspqRXvI6UQn5dZbLOKSdSlVFMPbnWzZ
 8KO8pPF6g5hMsIbLhvUJlJ/VWTLjwEjybjUke1tUzRVjcDn22liQpN6lCRx5xzOKodfb
 Msnw==
X-Gm-Message-State: AOAM533+evRk/MOKideKEbiTh3RmROGRyDvzPkFjTM+94y2GOXm4bx5K
 bkDvo9mi5iTTXZlY+5Evts/0mwfKVGgEZiVwHG5ZM0mZDpo/WdfWsevgl8HhXw5F5zfAnLlcIp2
 /7QNPpX6mBcRRe1Y=
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr16915426wrp.106.1614016051702; 
 Mon, 22 Feb 2021 09:47:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYCnFyHKncrKBsVGkYgdDBlj1wqclFa+3iRxNoiTYRrUuVlHgyICMSlSmH2YZZRRu7wxQdfQ==
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr16915408wrp.106.1614016051485; 
 Mon, 22 Feb 2021 09:47:31 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a21sm54196wmb.5.2021.02.22.09.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:47:31 -0800 (PST)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <875z2knoa5.fsf@dusky.pond.sub.org> <YDPMs1Hu8LDRJUhX@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: A brief look at deprecating our JSON extensions over RFC 8259
Message-ID: <c5d13648-445d-92b9-6bff-95bd2b99d52e@redhat.com>
Date: Mon, 22 Feb 2021 18:47:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDPMs1Hu8LDRJUhX@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/21 16:24, Daniel P. Berrangé wrote:
> This problem isn't unique to QEMU. Any app using JSON from the
> shell will have the tedium of quote escaping. JSON is incredibly
> widespread and no other apps felt it neccessary to introduce single
> quoting support, because the benefit doesn't outweigh the interop
> problem it introduces.

The quotes were introduced for C code (and especially qtest), not for 
the shell.  We have something like

     response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
                    "'property': 'temperature' } }", id);

These are sent to QEMU as double-quoted strings (the single-quoted JSON 
is parsed to get interpolation and printed back; commit 563890c7c7, 
"libqtest: escape strings in QMP commands, fix leak", 2014-07-01). 
However, doing the interpolation requires a parser that recognizes the 
single-quoted strings.

Markus, did you rebuild the qtests after disabling single-quoted 
strings?  "make check-qtest-x86_64" would have rebuilt them, but I'm 
confused by the results.

Paolo


