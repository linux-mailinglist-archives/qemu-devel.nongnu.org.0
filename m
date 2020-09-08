Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E1E260B01
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 08:33:21 +0200 (CEST)
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFXBw-0004Na-7P
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 02:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kFXAl-0003vG-Ow
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 02:32:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52239
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kFXAj-0005wu-I1
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 02:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599546723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gdlXGtwH5bYhFUIvB6lY0PBz/IYlHb/23MBJ6UHlFkU=;
 b=UEgCTI8AWR0LDmdYWbmTRo60KQ0So6/AJ2sI8RxSUiA3RCoFuv62XSsr1lUJrDRJdmVRO2
 oj59JVz2GzVNOUrOVTNMheOglMEf0CmFmhFrq10852p14dYY18TNCre8uhsayrUQnw40Tr
 M/b4+rHd5m7twUe8AqLEmAb6Opp5seo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-mJVQw0bEOweMhzxQfqB38w-1; Tue, 08 Sep 2020 02:32:01 -0400
X-MC-Unique: mJVQw0bEOweMhzxQfqB38w-1
Received: by mail-ed1-f69.google.com with SMTP id n4so5760004edo.20
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 23:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gdlXGtwH5bYhFUIvB6lY0PBz/IYlHb/23MBJ6UHlFkU=;
 b=C9uIaorwq3/JRY805j+X+mDzgoizI07vmeA8uFpHS8lLvxOR2MRLOeQE3FNR9VOLPy
 OesJABswI/8Qdstwg+TgsOieV8FHZUkiLijokn0lmzPKbD2MxnqxLwZ10zBA/xRoj4mM
 lOS9WgeQj2NZD0ILinhXkx2dOCY2p3MUo65Wn7CSNmnQWMttSnQ1hdP9CFPKBB4FAz7B
 dwPsaUMr3fMbevVSKTdBgBWoUL++LcDzOPv7kTUeefpeeYDKY+FKGjH/a+GgN1WJ01Tu
 jrY4/g3h8vtDlkxIBVTXtq7Gt3Ru7eZKMkEz4Ntlw4wEdX1r2ZC9SFkYO1tDRpbLwl+2
 zlXQ==
X-Gm-Message-State: AOAM530z+cW5cZidChVwX3Mbn38k6ID7q49z2qYhbMnZOfPLn/vvl1NY
 MBoEkTbVJawZaMuKFTLalZBwiZZ1TS8Lt7eex10BAXIjBMKb3/O6qzZ0UTpnRr+zQ9/Nm3BG65R
 KxtLOrDTsmgXZSzA=
X-Received: by 2002:a17:906:5856:: with SMTP id
 h22mr23891090ejs.480.1599546720369; 
 Mon, 07 Sep 2020 23:32:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmFlwksDSgJ0gQz3aHgAelJooiW3AIvRWVQGwIf0a+7xXPezYcaexS6a7Rq0xbET1AjSiJlg==
X-Received: by 2002:a17:906:5856:: with SMTP id
 h22mr23891078ejs.480.1599546720121; 
 Mon, 07 Sep 2020 23:32:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:11f8:efae:c014:c93e?
 ([2001:b07:6468:f312:11f8:efae:c014:c93e])
 by smtp.gmail.com with ESMTPSA id v25sm16835988edr.29.2020.09.07.23.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:31:59 -0700 (PDT)
Subject: Re: Where does these TPM flags comes from?
To: luoyonggang@gmail.com, qemu-level <qemu-devel@nongnu.org>
References: <CAE2XoE_k-=TT8S3vjbf_4c0kR96NhZ87zmfrYBxbStXyeb=FLA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c4e73e4f-3a0b-363c-f518-1ece3848806c@redhat.com>
Date: Tue, 8 Sep 2020 08:32:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_k-=TT8S3vjbf_4c0kR96NhZ87zmfrYBxbStXyeb=FLA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.825, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/20 22:45, 罗勇刚(Yonggang Luo) wrote:
> tpm_ss = ss.source_set()
> 
> tpm_ss.add(files('tpm_backend.c'))
> tpm_ss.add(files('tpm_util.c'))
> tpm_ss.add(when: 'CONFIG_TPM_PASSTHROUGH', if_true:
> files('tpm_passthrough.c'))
> tpm_ss.add(when: 'CONFIG_TPM_EMULATOR', if_true: files('tpm_emulator.c'))
> 
> softmmu_ss.add_all(when: 'CONFIG_TPM', if_true: tpm_ss)
> 
> I can not found the config for CONFIG_TPM_PASSTHROUGH  and 
> CONFIG_TPM_EMULATOR 
> 

It comes from *-config-devices.mak, which is created by
scripts/minikconf.py based on these rules from backends/tpm/Kconfig:

config TPM_BACKEND
    bool
    depends on TPM

config TPM_PASSTHROUGH
    bool
    default y
    # FIXME: should check for x86 host as well
    depends on TPM_BACKEND && LINUX

config TPM_EMULATOR
    bool
    default y
    depends on TPM_BACKEND

Paolo


