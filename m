Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19669610EF8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:49:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMuo-00062k-VQ; Fri, 28 Oct 2022 06:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1ooMug-00062P-CY
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:48:34 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1ooMuL-0003YY-EN
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:48:26 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 78so4470959pgb.13
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lBgLaR8tURdhd8Tddkm5cba18TzcLSmzcSdP5h71IZY=;
 b=jEAiVUzvxN3kOoTvZN5h0A2Q0Yrnqdcl+3jalQhYsi1MAnFiTpEAJofXT3TAXFOorV
 V5Ad/4AqrOiG3fCPd5bEVv5fw5U1p0bUtHd0g+n0UsM7wy61p4urgREy/mOowtun8RPt
 77vTfFFCOA8B3TknaeRnMnSvsgUZ/C0WGcOxDoY5UMOim8DotfzDtLnqK0N7EKHTevsr
 karrW+4hO2r46FjkN8v4sbo2/LJ2UAuGFnaz6QaZipn2nLSFlxdMHpOmnW/KGsrAmU6B
 yUBc4OChXjKBsqwMwcD+iZVZ1WzaRjR+Y7eJCjzLSRCmdWeEW2HPhgfvJ2O7EpSr0m/o
 D/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lBgLaR8tURdhd8Tddkm5cba18TzcLSmzcSdP5h71IZY=;
 b=7tmfwBOnnBCX9FZ9zrlOJ+t8nZvEcbbrgOKVxFsRY9+wFhaD5nMIRkpoVFwePcI72T
 /Q9FkK2bDZal99anfIDHsMjthnQ2hRrMjc6sUOLN+aOaogeAhbtm5zOGubs4O3tkKZj2
 WFQ6QiEdVYv7yyUn37fRdfFja21rPRvL9rViunmFtN//OPpccgHvq0EBlu1ZQochigc7
 7WdWvZQNfdtyJxh3hrCoFuWKsD6/+ito+7CuhYWFJuqwgFMMnsS9pyXz7CxlVm4+lvDx
 xmdn3X4ClsCgpSmoVv1Dwy6h7eYZUO6kHK191AqyyPz/1AnRFVWbpKQHK4qvqbw52foC
 rZ1w==
X-Gm-Message-State: ACrzQf3uMUhnW1i75myK9Slli+AycWa40OTb7EFje5GfY7YWjJrrWYMy
 383dfmkOSUIxTHc7zycXDJosXA==
X-Google-Smtp-Source: AMsMyM479DfRfmZDWaTFblJ5i3oZ4j11ZkKBVsVDJ3DZ96NDxo0G0GyK1VnR1GnH3vG6lUoXkQ8rGA==
X-Received: by 2002:a63:84c2:0:b0:46e:f239:354c with SMTP id
 k185-20020a6384c2000000b0046ef239354cmr25758812pgd.147.1666954090015; 
 Fri, 28 Oct 2022 03:48:10 -0700 (PDT)
Received: from john-millikin.com (aq206251.dynamic.ppp.asahi-net.or.jp.
 [220.146.206.251]) by smtp.gmail.com with ESMTPSA id
 om2-20020a17090b3a8200b0020d3662cc77sm4012959pjb.48.2022.10.28.03.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:48:09 -0700 (PDT)
Date: Fri, 28 Oct 2022 19:48:05 +0900
From: John Millikin <john@john-millikin.com>
To: John Johnson <john.g.johnson@oracle.com>
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Hannes Reinecke <hare@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: megasas regression in 7.1?
Message-ID: <Y1uzZUa2HZb2Bii+@john-millikin.com>
References: <4A0D1260-DB8D-47CA-9369-6F3C0B7296C9@oracle.com>
 <b18aa98a-e251-f5cd-ecca-4d3aa27bb374@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b18aa98a-e251-f5cd-ecca-4d3aa27bb374@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=john@john-millikin.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Passing `sizeof(cdb)` to `scsi_req_new()` looks like a correct fix to
me, but I'm not familiar enough with megasas / MegaRAID to be confident.

A possible slight alteration is to have `megasas_encode_lba()` return
the length of the CDB it synthesized, which IMO would make the
dependency more clear.

Two additional thoughts:

  1. The variable is called `cdb_len`, but maybe it would be better to
     have two separate variables `megasas_cdb_len` and `scsi_cdb_len`
     (with the buffer renamed to `scsi_cdb`).

  2. There is very similar logic in `megasas_handle_scsi()`, but in that
     function both `cdb` and `cdb_len` are obtained from the `MegasasCmd`.
     Would it be possible to use either an auxiliary function or a comment
     to disambiguate the expected meaning of "CDB" in both cases?

In general the QEMU code is written in a much terser style than I'm used
to, and I don't know to what extent reusing the same variable name with
different semantics is considered idiomatic here.


On Fri, Oct 28, 2022 at 11:10:46AM +0200, Thomas Huth wrote:
> On 28/10/2022 07.47, John Johnson wrote:
> > 
> > 	I pulled 7.1, and the megasas driver stopped being able to do reads from a disk.
> > It looks to be related to this commit:
> > 
> > https://github.com/qemu/qemu/commit/fe9d8927e265fd723a6dc87cd6d220f4677dbe1f#diffe3f5f30efc54747e0624dca63e5f55f0012736c1875b6e85526b3514e6911be3
> > 
> > which added some command buffer bounds checking to the SCSI subsysem.  Unfortunately,
> > when the megasas QEMU emulation receives a direct I/O command from the device driver
> > in megasas_handle_io(), it synthesizes a SCSI command from it in megasas_encode_lba(),
> > but passes the command buffer length from the driver frame instead of the length of the
> > buffer it synthesized the SCSI command in.  The driver (at least the Linux 4.14 version
> > I’m using) does not fill in the command buffer length in direct I/O frames, so
> > scsi_req_new() sees a 0 length command and fails it.
> > 
> > 
> > 	I worked around this issue with:
> > 
> > diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> > index 7082456..6e11607 100644
> > --- a/hw/scsi/megasas.c
> > +++ b/hw/scsi/megasas.c
> > @@ -1823,7 +1823,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
> >       megasas_encode_lba(cdb, lba_start, lba_count, is_write);
> >       cmd->req = scsi_req_new(sdev, cmd->index,
> > -                            lun_id, cdb, cdb_len, cmd);
> > +                            lun_id, cdb, sizeof (cdb), cmd);
> >       if (!cmd->req) {
> >           trace_megasas_scsi_req_alloc_failed(
> >               mfi_frame_desc(frame_cmd), target_id, lun_id);
> > 
> > and the driver can read the disk again, but I’m not sure this is the correct
> > fix since cdb_len is used for bounds checking elsewhere in megagsas_handle_io(),
> > although a 0 won’t fail there.
> > 
> > 	Is there anyone with megasas experience who could comment on this?
> 
> No clue about that megasas problem, but it might help if you put the experts
> on CC: (which can be found in the MAINTAINERS file). Done now.
> 
>  Thomas
> 

