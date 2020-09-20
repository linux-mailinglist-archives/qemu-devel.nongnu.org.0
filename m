Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A794B271609
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 18:46:27 +0200 (CEST)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kK2Tq-0004Je-8O
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 12:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kK2Qr-0003Zb-Oj
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 12:43:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38303
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kK2Qm-0002CG-2m
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 12:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600620194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHNQfTCd0xomy5hDOGVc5vM285GpFF9DYNd2U2k2Kys=;
 b=WpDi4idg/w+wEAZitIaPjckgVY0/Smi6JUbUBs9uNa9yvKTWElQT8p8kkTB/mai/YjxQSc
 rPmhhMfVEbiSQF3W3uKH0hTUsWzxZ84N/l2SOl+kwZneR9ScHH+FX93ITkCiz7aUPQvJGZ
 kVjHfPSt716MNC0sSVw9BR5R0EyYVSc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-Z_EXTS6vOG6Aqy1PqtA3ew-1; Sun, 20 Sep 2020 12:43:10 -0400
X-MC-Unique: Z_EXTS6vOG6Aqy1PqtA3ew-1
Received: by mail-wr1-f71.google.com with SMTP id h4so4779590wrb.4
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 09:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HHNQfTCd0xomy5hDOGVc5vM285GpFF9DYNd2U2k2Kys=;
 b=fPkUEH7qlM6f/s6ISRGqJmG13IpZC3taC8qkskmYDhbR622s0tKJEtREpNXr8m1QrF
 68WC515RZPsI+x24AJuGV+2U+TVxXCsMYmEsKdTkX7jr7328QSB/xWUVIzeJRaU43Ybr
 YvAtEGRB8c9r94Gt2iWq/34CbPCCmobc5xD+EfBTy9DnGRdstNWoftjGOz/JPdoALDpb
 CxKHa1mW/fEeWpW4kTnk8SFZnSaFFC9vSS8RN4ufyJHeSdxKG3GOwJiav44DMxmww/Dd
 MScnCj4H5ja5uCy86X0SB/THN5OZJttm8WzAMDPM1egLjBduJLneGV/GR/UntlVRTyAx
 XE0A==
X-Gm-Message-State: AOAM530AQrgyDpInQjafmC1gH7GDeNf6G7C78MPg5ofHXN31ii+WnEVp
 flYkTuuUv2kAgqtGkqLmSCY73luVGOlpbwtsijVhoQxDMNmIBiseOmqpZhuHHg4dmtGr0Bq+Qk5
 zeBItqkLMocIYYRk=
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr15976474wrt.157.1600620188884; 
 Sun, 20 Sep 2020 09:43:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+M/e2cFutS9ay9XJuXxaLKiW9Aa7WGm/xAcDbeAnr4nq41MXT4+ZkykWQkP2Fw+YyZCyxcQ==
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr15976462wrt.157.1600620188703; 
 Sun, 20 Sep 2020 09:43:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d107:d3ba:83ae:307e?
 ([2001:b07:6468:f312:d107:d3ba:83ae:307e])
 by smtp.gmail.com with ESMTPSA id b84sm16415210wmd.0.2020.09.20.09.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 09:43:08 -0700 (PDT)
Subject: Re: Hi Bonzini, I've seen your 3.1 branch have conflict with
 qemu.org/master
To: luoyonggang@gmail.com, qemu-level <qemu-devel@nongnu.org>
References: <CAE2XoE83rMdELyu5SSb=ysOzgbkSGHsmUVuonGRegkYGCdU9eQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <413236db-a7ef-542f-5011-892f2291c86d@redhat.com>
Date: Sun, 20 Sep 2020 18:43:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE83rMdELyu5SSb=ysOzgbkSGHsmUVuonGRegkYGCdU9eQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/20 12:43:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/09/20 16:53, 罗勇刚(Yonggang Luo) wrote:
> I rebased 3.1 branch on  qemu.org/master <http://qemu.org/master> and
> placed at
> https://github.com/lygstate/qemu/tree/for-3.1
> 
> And removed two conflcit revision
> 
> * iotests: Work around failing readlink -f
> * Simplify the .gitignore file
> 
> And test result at here:
> https://cirrus-ci.com/build/4717093432066048

Great, thanks.  I'll send a v2 of the pull request.

Paolo


