Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8DD52A038
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:16:49 +0200 (CEST)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqvC4-0008VS-8z
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqv7o-0005wz-QM; Tue, 17 May 2022 07:12:24 -0400
Received: from smtp60.i.mail.ru ([217.69.128.40]:47126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqv7m-0006cX-Ep; Tue, 17 May 2022 07:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=e4h5lPW50Hs7tH3IIMR2HnvA1aSdcw9APbLaOkTfxfI=; 
 t=1652785942;x=1653391342; 
 b=givV7U8n20SvNXnVXEffvxoP4hOejPpxPP5c4BOYiP0Y7YGHnc8glfcsXCp3vsqFi85D7wckbSopOZGtnqp+q2A8TEw1mPl5Sc0XGOFzjQ5KCWtmFGCfz6OxSVKs93Qfy+h0pOr77wEDiyPgR4qT7F+7H+U+n/Hf3IIEgf1AWAkXVwVbeNz6I3tAV9b1PTTn0MP2AR2FlPZJCC//2asvljVAaSSO4cW2WAOkMdqaFqRPMm+iNUA/chlCSw7ti2SiMq0h5tTqjJsZvAu9PHn79RdqiD+Oqg5scDWX/IV0RTQw/IxWqGhX4c7sO4tkS0Ehv+D2B7JIkFzi4ER34tR+RA==;
Received: by smtp60.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nqv7h-0000gZ-Ar; Tue, 17 May 2022 14:12:17 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PATCH v4 0/3] block/dirty-bitmaps: fix and improve bitmap merge
Date: Tue, 17 May 2022 14:12:03 +0300
Message-Id: <20220517111206.23585-1-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp60.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9AB830312DE1E2EF8170D3913A15B717AD1D8E5E9B27BE4C0182A05F53808504050BDAA9A6BDDA6AA463413514CE1B107C95DE7D7EA4534A9986FB595B93F6145
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75263010198C72082EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DC5B68A43B0CFEA28638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D850137E0B9B3520346A5BB379CF2BA1E86F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCECADA55FE5B58BB7A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD1828451B159A507268D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE38D4DC57D478E688043FB282AF95FB6BD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE3A5ED62E35AC703CC6E0066C2D8992A16C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637A3BBED0027C3795BEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBB0624710993A7B7FF9E00002BF8257C50E40A2B0AA008609C2B6934AE262D3EE7EAB7254005DCED2CD25FFCC17EBB02F36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D54D082881546D93491699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34AC223B6CC5B2DFACE3DF8CEE91633E78B0271B4A928B32BB0B1C27D616B49E5B667C0556F90C858F1D7E09C32AA3244CB8FA11F50AA573D438AEA15D9EDD1EDD3A76366E8A9DE7CAAD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3fsA429394M7iEPdnTsWlQ==
X-Mailru-Sender: 6C3E74F07C41AE9425C26D04B7325D44E891999DDF3A5D6129C14D22BC6AE9084FB1A2BB105D0B89E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.40;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp60.i.mail.ru
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

v4:
01,03: add Kevin's r-b
02: add hbitmap_free() on success patch if local_backup is not needed

Vladimir Sementsov-Ogievskiy (3):
  block: block_dirty_bitmap_merge(): fix error path
  block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
  block: simplify handling of try to merge different sized bitmaps

 include/block/block_int-io.h    |  2 +-
 include/qemu/hbitmap.h          | 15 ++-----------
 block/backup.c                  |  6 ++---
 block/dirty-bitmap.c            | 26 +++++++++------------
 block/monitor/bitmap-qmp-cmds.c | 40 ++++++++++++++++++---------------
 util/hbitmap.c                  | 25 ++++++---------------
 6 files changed, 45 insertions(+), 69 deletions(-)

-- 
2.35.1


