Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87DE6A0FDA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:55:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGkQ-0008NZ-Md; Thu, 23 Feb 2023 13:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matoro_mailinglist_qemu@matoro.tk>)
 id 1pVGk9-0007L1-Sq
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:55:04 -0500
Received: from [2600:1700:4b10:9d80::2] (helo=matoro.tk)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <matoro_mailinglist_qemu@matoro.tk>)
 id 1pVGk8-0003bd-18
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:55:01 -0500
DKIM-Signature: a=rsa-sha256; bh=vD3xmIK+JRtabunvCPJ/Ersg3wFR+mpk5RzZ4+DJSrg=; 
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20221223; t=1677178496; v=1; x=1677610496;
 b=EQS1DmWS/ZS1atEbIVTL8xje7wAhMf7wRXv8wN21lwvj/O3SceCJNiD41nCDZFUmbclptHbl
 JoHogZHdThaAK7F+woD2SSezhl5PeYzdvN+ioXWeLzYmF56uHcTwvJSzju5TY1kE02+FxeEPq+9
 9HTNMpZhC0M+aDuS37fcNj0qER6elIudFw2chKPLNWkhq7zdLZHQJYPdk7AwgFrMLx4PTWqocqV
 r5uQNeA8u0M4Md4LoTiIv+IMa95TMDkRw0xwrJd5Ol0sXGm2RzinKZ0qxLYZxiIorQg0W69kQ5x
 ZoVmvLyLXXWiEvMb79akEonn5FK5XfPLTsjrt/GooxhIo3bAHB39dRRkjbB4U/+ffqkcDbhy/+Y
 qC7jJYkGetWd5eeigseCJD3SIV/xmvUaRCRK7/4JOjc3I0MyR2SMmjTsJyjsiyiHU70s8NlpUK8
 TF0K72a2M1anANSaEUE4qKb9iInHjjwlW8Ll7ywmqm2mBkuRV9gvJTkN94mCYw/YXAUq7XDca2P
 0Rf/pewaIW1aN3UOHxTxMheDhiRktz1jiOGa7xLCieWc9CCpZas5izVp7CC6fE52VJv/tqQvlDd
 cABjPHIt8CmxvD1QO/nYa6NAFkZbeEHNfPsrUbtXHDli8EL/m6xURfgKHGmQG5XKzfdBbtFW4Cu
 f4XpBFFyxYc=
Received: by matoro.tk (envelope-sender <matoro_mailinglist_qemu@matoro.tk>)
 with ESMTPS id 241b52e9; Thu, 23 Feb 2023 13:54:56 -0500
MIME-Version: 1.0
Date: Thu, 23 Feb 2023 13:54:56 -0500
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] crypto: allow client/server cert chains
In-Reply-To: <Y/OVaeIyGCt++yFH@redhat.com>
References: <20230213180049.19093-1-matoro_mailinglist_qemu@matoro.tk>
 <Y/OVaeIyGCt++yFH@redhat.com>
Message-ID: <d12a0cc05bff5b4cc6274cc3ff936ae1@matoro.tk>
X-Sender: matoro_mailinglist_qemu@matoro.tk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2600:1700:4b10:9d80::2
 (failed)
Received-SPF: pass client-ip=2600:1700:4b10:9d80::2;
 envelope-from=matoro_mailinglist_qemu@matoro.tk; helo=matoro.tk
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  matoro <matoro_mailinglist_qemu@matoro.tk>
From:  matoro via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023-02-20 10:44, Daniel P. Berrangé wrote:
> On Mon, Feb 13, 2023 at 01:00:49PM -0500, matoro_mailinglist_qemu--- 
> via wrote:
>> From: matoro <matoro@users.noreply.github.com>
>> 
>> The existing implementation assumes that client/server certificates 
>> are
>> single individual certificates.  If using publicly-issued 
>> certificates,
>> or internal CAs that use an intermediate issuer, this is unlikely to 
>> be
>> the case, and they will instead be certificate chains.  While this can
>> be worked around by moving the intermediate certificates to the CA
>> certificate, which DOES currently support multiple certificates, this
>> instead allows the issued certificate chains to be used as-is, without
>> requiring the overhead of shuffling certificates around.
>> 
>> Corresponding libvirt change is available here:
>> https://gitlab.com/libvirt/libvirt/-/merge_requests/222
>> 
>> Signed-off-by: matoro <matoro_mailinglist_qemu@matoro.tk>
> 
> I'm afraid that because the Signed-off-by is intended as a legal
> statement that you're permitted to contribute this change, we
> require it to use the person's legal recognised real name (both
> forename + surname), not a psuedo-name, nor merely a partial
> name. Could you either resend this submission, or just reply
> to this mail giving a new Signed-off-by.
> 
> The email address can be of your choosing, but should generally
> be matched to the git commit authorship
> 
> 
> With regards,
> Daniel

Hi Daniel, unfortunately I am unable to use my real name with 
contributions due to my employment.  Is there any way for me to release 
copyright on this, or have someone else submit it on my behalf?  (I have 
done the latter with kernel contributions before)

If not I understand and will continue simply patching this for personal 
use, and anybody else who needs this functionality can do the same.

